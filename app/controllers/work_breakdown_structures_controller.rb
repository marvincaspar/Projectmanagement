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
end
