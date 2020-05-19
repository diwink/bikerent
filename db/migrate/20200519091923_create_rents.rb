class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.integer :total_price
      t.references :moto, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
