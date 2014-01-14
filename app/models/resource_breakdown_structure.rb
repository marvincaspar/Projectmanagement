class ResourceBreakdownStructure < ActiveRecord::Base
  extend Enumerize

  belongs_to :qualification
  belongs_to :project

  enumerize :resource_type, in: { sachmittel: 1,
                                  personal_intern: 2,
                                  personal_extern: 3 },
                              default: :personal_intern,
                              predicates: { prefix: true }
end
