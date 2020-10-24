class AddOpenTimeToParks < ActiveRecord::Migration[5.2]
  def change
    add_column :parks, :open_time, :string
    add_column :parks, :price, :string
    add_column :parks, :tel, :integer
    add_column :parks, :description, :text
  end
end
