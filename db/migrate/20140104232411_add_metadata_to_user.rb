class AddMetadataToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :title, :string
    add_column :users, :phone, :string
    add_column :users, :mobile, :string
    add_column :users, :department, :string
    add_column :users, :position, :string
    add_column :users, :location, :string
  end
end
