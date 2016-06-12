class Product < ActiveRecord::Base
  def formatted_price_usd
    CurrencyAmount.new(currency: "USD", cents: price_in_cents_usd).to_s
  end
end
