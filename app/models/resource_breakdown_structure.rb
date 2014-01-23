class ResourceBreakdownStructure < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :project
  has_many :resources

  enumerize :resource, in: { personal: 1,
                             extern: 2 },
                          default: :personal,
                          predicates: { prefix: true }

  enumerize :resource_type, in: { intern: 1,
                                  extern: 2 },
                              default: :intern,
                              predicates: { prefix: true }

  def name_for_selects
    "#{'&nbsp;&nbsp;&nbsp;&nbsp;' * level} #{name}".html_safe
  end
  
  def self.order_for_selects(project_id)
    output = []
    arr = ResourceBreakdownStructure.where('project_id = ?', project_id)
                                    .order('resource_breakdown_structures.level ASC, resource_breakdown_structures.parent ASC, resource_breakdown_structures.order ASC')

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
