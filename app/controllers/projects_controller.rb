class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @work_breakdown_structure = WorkBreakdownStructure.new
  end

  def new
    @project = Project.new
  end

  def create 
    @project = Project.new(project_params)
    @project.user = current_user

    respond_to do |format|
      if @project.save
        current_user.add_role :project_admin, @project
        ProductBreakdownStructure.create name: @project.name, level: 0, parent: 0, order: 0, user: current_user, project: @project
        WorkBreakdownStructure.create name: @project.name, level: 0, parent: 0, order: 0, user: current_user, project: @project
        ResourceBreakdownStructure.create name: @project.name, level: 0, parent: 0, order: 0, user: current_user, resource: :personal, resource_type: :intern, project: @project  

        format.html { redirect_to project_path(@project), notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    ProductBreakdownStructure.find("project_id = ? ", @project.id).destroy
    WorkPackage.find("project_id = ?", @project.id).destroy
    WorkBreakdownStructure.find("project_id = ?", @project.id).destroy
    ResourceBreakdownStructure.find("project_id = ?", @project.id).destroy

    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :user_id, :due)
    end
end
