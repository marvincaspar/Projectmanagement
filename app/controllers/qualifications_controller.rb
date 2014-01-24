class QualificationsController < ApplicationController
  load_and_authorize_resource :project
  before_filter :authenticate_user!
  before_action :set_qualification, only: [:show, :edit, :update, :destroy]

  def create
    @qualification = Qualification.new(qualification_params)
    @qualification.user = current_user
    @qualification.project_id = params[:project_id]

    respond_to do |format|
      if @qualification.save
        format.html { redirect_to project_resource_breakdown_structures_path, notice: 'WP was successfully created.' }
        format.json { render action: 'show', status: :created, location: @qualification }
      else
        format.html { render action: 'new' }
        format.json { render json: @qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qualification
      @qualification = Qualification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qualification_params
      params.require(:qualification).permit(:name, :experience, :project_id, :user_id)
    end
end
