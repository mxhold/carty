class AddCart < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.timestamps
    end

    create_table :cart_products do |t|
      t.references :cart, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
