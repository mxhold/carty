require 'rails_helper'

RSpec.feature "Shopping cart management", type: :feature do
  scenario "Adding a product to the cart" do
    load "db/seeds.rb"

    visit '/'

    expect(page).to have_content("0 items in your cart")

    within("#product1") do
      fill_in("cart_quantity", with: "2")
      click_on("Add to cart")
    end

    expect(page).to have_content("2 items in your cart")
    within("#cart") do
      expect(page).to have_content "Glazed donut (2) - $1.20"
      expect(page).to have_content "Total: $2.40"
    end
  end

  scenario "Checkout" do
    load "db/seeds.rb"

    visit '/'

    within("#product1") do
      click_on("Add to cart")
    end

    within("#product1") do
      click_on("Add to cart")
    end

    within("#cart") do
      click_on("Checkout")
    end

    within("#cart") do
      expect(page).to have_content "0 items in your cart"
    end

    expect(page).to have_content "Purchase complete"
  end
end
