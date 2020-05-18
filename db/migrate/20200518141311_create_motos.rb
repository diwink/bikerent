class CreateMotos < ActiveRecord::Migration[6.0]
  def change
    create_table :motos do |t|
      t.string :brand
      t.string :model
      t.string :address
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :price_per_day

      t.timestamps
    end
  end
end
