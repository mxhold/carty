require "spec_helper"
require_relative "../../app/models/currency_amount"

RSpec.describe CurrencyAmount do
  describe "#to_s" do
    it "returns a formatted string representing the amount" do
      amount = CurrencyAmount.new(currency: "USD", cents: 120)
      expect(amount.to_s).to eql "$1.20"
    end
  end
end
