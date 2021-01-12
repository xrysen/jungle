require 'rails_helper'

RSpec.feature "Product details", type: :feature, js: true do
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

    scenario "User is taken to product page for the product they click on" do
      visit root_path

      click_link("Details »", match: :first)
      page.has_content?('Description')
      expect(page).to have_text "Description"
      save_screenshot
    end


end
