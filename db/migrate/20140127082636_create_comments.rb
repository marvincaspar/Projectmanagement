class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :estimation, index: true
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
