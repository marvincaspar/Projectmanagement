class EstimationsController < ApplicationController
  load_and_authorize_resource :project
  before_filter :authenticate_user!
  before_action :set_estimation, only: [:edit, :update, :destroy]

  def index
    @iteration = Iteration.find(params[:iteration_id])
    @estimation = Estimation.new
  end

  def create 
    set_estimation

    @estimation.update(estimation_params)
    @estimation.iteration_id = params[:iteration_id]
    @estimation.user = current_user
    
    respond_to do |format|
      if @estimation.save

        format.html { redirect_to project_iterations_path, notice: 'Estimation was successfully created.' }
        format.json { render json: @estimation }
      else
        format.html { render action: 'new' }
        format.json { render json: @estimation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @estimation.update(estimation_params)
        format.json { head :no_content }
      else
        format.json { render json: @estimation.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @estimation = Estimation.where('iteration_id = ? AND user_id = ?', params[:iteration_id], current_user.id).last
    if @estimation.nil?
      @estimation = Estimation.new(iteration_id: params[:iteration_id]) 
    end

    respond_to do |format|
      format.json { render json: @estimation }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimation
      unless params[:id].blank?
        @estimation = Estimation.find(params[:id])
      end
      if @estimation.nil?
        @estimation = Estimation.new(iteration_id: params[:iteration_id]) 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimation_params
      params.require(:estimation).permit(:iteration_id, :effort, :user_id, :message)
    end
end
