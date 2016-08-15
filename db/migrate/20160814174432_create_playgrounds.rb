class CreatePlaygrounds < ActiveRecord::Migration
  def change
    create_table :playgrounds do |t|
      t.string :address
      t.integer :num_of_ppl
      t.string :description

      t.timestamps null: false
    end
  end
end
