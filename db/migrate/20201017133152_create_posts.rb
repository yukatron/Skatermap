class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :skater_id, null: false
      t.integer :park_id
      t.string :title, null: false
      t.text :cation

      t.timestamps null: false
    end
  end
end
