class CreatePlaygrounds < ActiveRecord::Migration
  def change
    create_table :playgrounds do |t|
      t.string :address
      t.integer :rating
      t.string :description

      t.timestamps null: false
    end
  end
end
