class AddIsDeletedToSkaters < ActiveRecord::Migration[5.2]
  def change
    add_column :skaters, :is_deleted, :boolean, null: false, default: false
  end
end
