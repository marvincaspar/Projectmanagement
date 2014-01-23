class ProductBreakdownStructuresController < ApplicationController
  before_action :set_product_breakdown_structure, only: [:show, :edit, :update, :destroy]

  def save_structure
    pbs = ActiveSupport::JSON.decode(params[:structure])

    parent = ProductBreakdownStructure.where('project_id = ? AND parent = 0', params[:project_id]).first
    save_element_structure(pbs, parent.id, 1, ProductBreakdownStructure)

    respond_to do |format|
      format.json { head :no_content }
    end
  end
  
  def index
    @project = Project.find(params[:project_id])
    @product_breakdown_structure = ProductBreakdownStructure.new(project: @project)
  end
  
  def show
    respond_to do |format|
      format.json { render json: @product_breakdown_structure }
    end
  end

  def edit
    respond_to do |format|
      format.json { render json: @product_breakdown_structure.to_json }
    end
  end

  def create 
    set_product_breakdown_structure

    @product_breakdown_structure.update(product_breakdown_structure_params)
    @product_breakdown_structure.user = current_user
    @product_breakdown_structure.project_id = params[:project_id]
    @product_breakdown_structure.parent = params[:parent]
    @product_breakdown_structure.level = ProductBreakdownStructure.find(@product_breakdown_structure.parent).level + 1

    respond_to do |format|
      if @product_breakdown_structure.save
        format.html { redirect_to project_product_breakdown_structures_path, notice: 'PBS was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_breakdown_structure }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_breakdown_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    childs = find_childs(@product_breakdown_structure.id)
    childs.each do |c|
      c.destroy
    end
    @product_breakdown_structure.destroy
    respond_to do |format|
      format.html { redirect_to project_product_breakdown_structures_path }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_breakdown_structure
      @product_breakdown_structure = ProductBreakdownStructure.find(params[:id])
      if @product_breakdown_structure.nil?
        @product_breakdown_structure = ProductBreakdownStructure.new(project: @project) 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_breakdown_structure_params
      params.require(:product_breakdown_structure).permit(:name, :parent, :user_id, :order, :level, :project_id)
    end

    # find all the childs to avoid dead entries
    def find_childs(parent)
      ret = []
      el = ProductBreakdownStructure.where('parent = ?', parent)
      el.each do |e|
        ret << e
        ret += find_childs(e.id) 
      end
      ret
    end
end
