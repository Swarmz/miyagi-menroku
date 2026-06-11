class CreateShops < ActiveRecord::Migration[8.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :website

      t.timestamps
    end
      add_index :shops, [ :name, :city ], unique: true
      add_index :shops, :city
  end
end
