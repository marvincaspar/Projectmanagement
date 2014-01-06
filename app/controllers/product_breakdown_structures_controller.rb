class ProductBreakdownStructuresController < ApplicationController
  before_action :set_product_breakdown_structure, only: [:show, :edit, :update, :destroy]

  def new
    @product_breakdown_structure = ProductBreakdownStructure.new
  end

  def create 
    @product_breakdown_structure = ProductBreakdownStructure.new(product_breakdown_structure_params)
    @product_breakdown_structure.user = current_user
    @product_breakdown_structure.project_id = params[:project_id]
    @product_breakdown_structure.parent = params[:parent]
    @product_breakdown_structure.level = ProductBreakdownStructure.find(@product_breakdown_structure.parent).level + 1

    respond_to do |format|
      if @product_breakdown_structure.save
        format.html { redirect_to project_path(@product_breakdown_structure.project), notice: 'PBS was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_breakdown_structure.project.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_breakdown_structure
      @project = ProductBreakdownStructure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_breakdown_structure_params
      params.require(:product_breakdown_structure).permit(:name, :parent, :user_id, :order, :level, :project_id)
    end
end
