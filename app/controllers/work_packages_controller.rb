class WorkPackagesController < ApplicationController

  def add_element
    wbs = WorkBreakdownStructure.find(params["work_breakdown_structure_id"])

    WorkPackage.create(name: params[:name], description: params[:description], target: params[:target], 
                       resources: params[:resources], risks: params[:risks], work_breakdown_structure_id: wbs.id, 
                       start: params[:start], end: params[:end], cost: params[:cost], owner: current_user, project: wbs.project)

    respond_to do |format|
      msg = { :status => "ok", :message => "Success!" }
      format.json  { render :json => msg }
    end
  end
end
