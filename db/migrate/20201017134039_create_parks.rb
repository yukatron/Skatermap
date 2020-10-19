class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.integer :country_id
      t.string :name, null: false
      t.string :zip, null: false
      t.string :address, null: false
      t.string :image

      t.timestamps
    end
  end
end
