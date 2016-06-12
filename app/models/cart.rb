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

  def products_with_quantities
    products.reduce({}) do |products_with_quantities, product|
      if products_with_quantities[product]
        products_with_quantities[product] += 1
      else
        products_with_quantities[product] = 1
      end

      products_with_quantities
    end
  end

  def checkout
    products.clear
  end
end
