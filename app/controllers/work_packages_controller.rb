class WorkPackagesController < ApplicationController
  load_and_authorize_resource :project
  before_filter :authenticate_user!
  before_action :set_work_package, only: [:show, :edit, :update, :destroy]

  def create
    set_work_package

    @work_package.update(work_package_params)
    @work_package.owner = current_user
    @work_package.project_id = params[:project_id]
    @work_package.work_breakdown_structure_id = params[:work_breakdown_structure_id]

    respond_to do |format|
      if @work_package.save
        format.html { redirect_to project_work_breakdown_structures_path, notice: 'WP was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_package }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_package.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @work_package.to_json(:include => :work_breakdown_structure) }
    end
  end

  def edit
    respond_to do |format|
      format.json { render json: @work_package.to_json }
    end
  end

  def destroy
    @work_package.destroy
    respond_to do |format|
      format.html { redirect_to project_work_breakdown_structures_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_package
      @work_package = WorkPackage.find(params[:id])
      if @work_package.nil?
        @work_package = WorkPackage.new(project: @project) 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_package_params
      params.require(:work_package).permit(:name, :parent, :start, :end, :cost, :work_breakdown_structure_id,
                                           :owner_id, :project_id, :risks, :description, :resources, :target)
    end
end