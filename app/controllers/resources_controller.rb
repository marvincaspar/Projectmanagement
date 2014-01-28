class ResourcesController < ApplicationController
  load_and_authorize_resource :project
  before_filter :authenticate_user!
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def create
    set_resource

    @resource.update(resource_params)
    @resource.user = current_user
    @resource.project_id = params[:project_id]
    @resource.qualification_id = params[:qualification_id]
    @resource.resource_breakdown_structure_id = params[:resource_breakdown_structure_id]

    respond_to do |format|
      if @resource.save
        format.html { redirect_to project_resource_breakdown_structures_path, notice: 'WP was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resource }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @resource.to_json(include: {resource_breakdown_structure: {}, qualification: {}}) }
    end
  end

  def edit
    respond_to do |format|
      format.json { render json: @resource.to_json }
    end
  end

  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to project_work_breakdown_structures_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      unless params[:id].blank?
        @resource = Resource.find(params[:id])
      end
      if @resource.nil?
        @resource = Resource.new(project: @project) 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:qualification_id, :resource_breakdown_structure_id, :count, :amount, :user_id, :project_id)
    end
end