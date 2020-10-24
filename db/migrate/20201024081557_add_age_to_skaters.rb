class AddAgeToSkaters < ActiveRecord::Migration[5.2]
  def change
  	add_column :skaters, :age, :integer
    add_column :skaters, :biography, :text
  end
end
