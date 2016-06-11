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
end
