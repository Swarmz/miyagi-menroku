class CreateVisits < ActiveRecord::Migration[8.1]
  def change
    create_table :visits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.date :visited_on, null: false
      t.string :menu_item, null: false
      t.integer :rating, null: false
      t.text :notes

      t.timestamps
    end
    add_index :visits, :rating
    # all visits to a specific shop sorted by date
    add_index :visits, [ :shop_id, :visited_on ]
  end
end
