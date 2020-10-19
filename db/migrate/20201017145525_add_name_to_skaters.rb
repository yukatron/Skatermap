class AddNameToSkaters < ActiveRecord::Migration[5.2]
  def change
    add_column :skaters, :name, :string
  end
end
