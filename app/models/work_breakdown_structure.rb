class WorkBreakdownStructure < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :work_packages

  def name_for_selects
    "#{'&nbsp;&nbsp;&nbsp;&nbsp;' * level} #{name}".html_safe
  end
  
  def self.order_for_selects(project_id)
    output = []
    arr = WorkBreakdownStructure.where('project_id = ?', project_id)
                                .order('work_breakdown_structures.level ASC, work_breakdown_structures.parent ASC, work_breakdown_structures.order ASC')

    root = arr.where('level = 0').first

    output << root
    output = output + self.get_childs(root.id, arr)
    
    output
  end

  def self.get_childs(parent_id, nodes)
    output = []
    nodes.each do |node|
      if node.parent == parent_id
        output << node
        output = output + self.get_childs(node.id, nodes)
      end
    end

    output
  end
end
