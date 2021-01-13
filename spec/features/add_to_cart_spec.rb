require 'rails_helper'

RSpec.feature "Add to cart", type: :feature, js: true do
  #setup
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
      end
    end

    scenario "Cart updates when product is added to it" do
      visit root_path
      click_on("Add", match: :first)
      expect(page).to have_text "My Cart (1)"
      save_screenshot
    end
end