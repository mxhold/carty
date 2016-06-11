class AddProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price_in_cents_usd

      t.timestamps
    end
  end
end
