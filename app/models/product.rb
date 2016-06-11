class Product < ActiveRecord::Base
  def formatted_price_usd
    price_in_dollars_usd = price_in_cents_usd / 100.0
    sprintf("$%.2f", price_in_dollars_usd)
  end
end
