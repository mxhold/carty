require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "#add_product" do
    it "adds the product to the cart" do
      cart = Cart.new
      product = Product.new

      cart.add_product(product)

      expect(cart.products.to_a).to eql [product]
    end
  end

  describe "#formatted_total_price_usd" do
    it "returns the price in dollars USD" do
      cart = Cart.new
      cart.add_product(Product.new(:price_in_cents_usd => 100))
      cart.add_product(Product.new(:price_in_cents_usd => 220))
      expect(cart.formatted_total_price_usd).to eql "$3.20"
    end
  end

  describe "#products_with_quantities" do
    it "return products in the cart with quantities" do
      product1 = Product.create!(name: "Product1")
      product2 = Product.create!(name: "Product2")

      cart = Cart.new
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product2)

      expect(cart.products_with_quantities).to eql({
        product1 => 1,
        product2 => 2,
      })
    end
  end

  describe "#checkout" do
    it "clears the contents of the cart" do
      product1 = Product.create!(name: "Product1")

      cart = Cart.new
      cart.add_product(product1)

      cart.checkout

      expect(cart.products).to be_empty
    end
  end
end
