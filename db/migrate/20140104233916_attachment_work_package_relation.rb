class AttachmentWorkPackageRelation < ActiveRecord::Migration
  def change
    create_join_table :attachments, :work_packages
  end
end
