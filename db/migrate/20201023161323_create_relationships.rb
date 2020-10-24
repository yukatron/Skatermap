class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
    	t.references :skater, foreign_key: true
      	t.references :follow, foreign_key: { to_table: :skaters }

      	t.timestamps

      	t.index [:skater_id, :follow_id], unique: true
    end
  end
end
