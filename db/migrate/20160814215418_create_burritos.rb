class CreateBurritos < ActiveRecord::Migration
  def change
    create_table :burritos do |t|
      t.string :name
      t.integer :restaurant_id

      t.timestamps(null: false)
    end
  end
end
