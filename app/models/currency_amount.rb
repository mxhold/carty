class CurrencyAmount
  def initialize(currency:, cents:)
    unless currency == "USD"
      fail "Unsupport currency: #{currency}"
    end

    @cents = cents
  end

  def to_s
    sprintf("$%.2f", @cents / 100.0)
  end
end
