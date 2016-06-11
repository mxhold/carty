require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has a name, price in cents, and price in dollars" do
    product = Product.new(name: "Donut with sprinkles", price_in_cents_usd: 140)
    expect(product.name).to eql "Donut with sprinkles"
    expect(product.price_in_cents_usd).to eql 140
    expect(product.formatted_price_usd).to eql "$1.40"
  end

  describe "seeds" do
    it "creates some products with names and prices" do
      load "db/seeds.rb"

      expect(Product.count).to eql 5

      Product.all.each do |product|
        expect(product.name).to be_present
        expect(product.price_in_cents_usd).to be_present
      end
    end
  end
end
