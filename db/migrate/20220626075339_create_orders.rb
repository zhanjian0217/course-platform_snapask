class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :slug
      t.integer :price
      t.integer :expiration_day
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
