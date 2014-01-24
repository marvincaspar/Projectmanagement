class ResourceAllocationMatricesController < ApplicationController
  load_and_authorize_resource :project
  before_filter :authenticate_user!
  before_action :set_resource_allocation_matrix, only: [:show, :edit, :update, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @resource_allocation_matrix = ResourceAllocationMatrix.new(project: @project)
  end

  def edit
    respond_to do |format|
      format.json { render json: @resource_allocation_matrix.to_json }
    end
  end

  def create
    set_resource_allocation_matrix

    @resource_allocation_matrix.work_package_id = params[:work_package_id]
    @resource_allocation_matrix.resource_breakdown_structure_id = params[:resource_breakdown_structure_id]
    @resource_allocation_matrix.product_breakdown_structure_id = params[:product_breakdown_structure_id]
    @resource_allocation_matrix.project_id = params[:project_id]

    #@resource_allocation_matrix.user = current_user

    respond_to do |format|
      if @resource_allocation_matrix.save
        format.html { redirect_to project_resource_allocation_matrices_path, notice: 'RAM was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resource_allocation_matrix }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource_allocation_matrix.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_allocation_matrix
      @resource_allocation_matrix = ResourceAllocationMatrix.where('work_package_id = ?', params[:id]).first
      if @resource_allocation_matrix.nil?
        @resource_allocation_matrix = ResourceAllocationMatrix.new(project: @project) 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_allocation_matrix_params
      params.require(:resource_allocation_matrix).permit(:work_package_id, :resource_breakdown_structure_id, :product_breakdown_structure_id, :project_id)
    end

end
