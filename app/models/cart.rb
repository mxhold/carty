class Cart < ActiveRecord::Base
  has_many :products, through: :cart_products
  has_many :cart_products

  def add_product(product)
    products << product
  end

  def formatted_total_price_usd
    total_price_in_cents_usd = products.map(&:price_in_cents_usd).reduce(0, :+)
    CurrencyAmount.new(currency: "USD", cents: total_price_in_cents_usd).to_s
  end
end
