class IterationsController < ApplicationController
  load_and_authorize_resource :project
  before_filter :authenticate_user!
  before_action :set_iteration, only: [:edit, :update, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @iteration = Iteration.first
    @estimation = Estimation.new
  end

  def show
    @iterations = Iteration.where('work_package_id = ?', params[:id])
    counter = 0
    @iterations.each do |i|
      @iterations[counter].estimations.sort_by &:created_at
      counter = counter + 1
    end
    respond_to do |format|
      format.json { render json: @iterations.to_json(include: {estimations: {include: :user}}) }
    end
  end

  def comment_html
    render partial: 'comment'
  end

  def create 
    @iteration = Iteration.new(iteration_params)
    #@iteration.work_package_id = params[:work_package_id]
    old_iteration = WorkPackage.find(@iteration.work_package_id).iterations.last
    
    respond_to do |format|
      if @iteration.save
        old_iteration.open = false
        old_iteration.save

        @iterations = Iteration.where('work_package_id = ?', @iteration.work_package_id)

        format.html { redirect_to project_iterations_path, notice: 'Project was successfully created.' }
        format.json { render json: @iterations.to_json(include: {estimations: {include: :user}}) }
      else
        format.html { render action: 'new' }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iteration
      @iteration = Iteration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iteration_params
      params.require(:iteration).permit(:open, :work_package_id)
    end
end
