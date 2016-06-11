require 'rails_helper'

RSpec.feature "Viewing Products", type: :feature do
  scenario "viewing home page" do
    load "db/seeds.rb"

    visit '/'

    expect(page).to have_content "Glazed donut"
    expect(page).to have_content "$1.20"
  end
end
