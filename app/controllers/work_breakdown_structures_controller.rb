class WorkBreakdownStructuresController < ApplicationController
  
  def save_structure
    wbs = ActiveSupport::JSON.decode(params[:wbs])

    wbs.each do |item| 
      curr = WorkBreakdownStructure.find(item["id"].to_i)
      curr.parent = item["parent"].to_i
      curr.level = item["level"].to_i
      curr.save
    end

    respond_to do |format|
      format.json { render :json => "OK" }
    end
  end

  def destroy
    element = WorkBreakdownStructure.find(params["id"])
    childs = find_childs(element.id)
    childs.each do |c|
      c.destroy
    end
    element.destroy
    respond_to do |format|
      format.html { redirect_to project_path(params["project_id"]) }
      format.json { head :no_content }
    end
  end

  def add_element
    parentElement = WorkBreakdownStructure.find(params["id"])

    WorkBreakdownStructure.create(name: params[:name], level: parentElement.level + 1, parent: parentElement.id, order: 0, user: current_user, project: parentElement.project)

    respond_to do |format|
      msg = { :status => "ok", :message => "Success!" }
      format.json  { render :json => msg }
    end
  end

  private
    # find all the childs to avoid dead entries
    def find_childs(parent)
      ret = []
      el = WorkBreakdownStructure.where('parent = ?', parent)
      el.each do |e|
        ret << e
        ret += find_childs(e.id) 
      end
      ret
    end
end
