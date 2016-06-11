class Cart < ActiveRecord::Base
  has_many :products, through: :cart_products
  has_many :cart_products

  def add_product(product)
    products << product
  end

  def formatted_total_price_usd
    total_price_usd = products.map(&:price_in_cents_usd).sum / 100.0
    sprintf("$%.2f", total_price_usd)
  end
end
