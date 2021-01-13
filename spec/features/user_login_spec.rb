require 'rails_helper'

RSpec.feature "User Authentication", type: :feature, js: true do
  before :each do
    User.create!(first_name: "Sean", last_name: "Oyler", email: "sean@sean.com", password: "password", password_confirmation: "password")
  end

  scenario "User can login" do
    visit "/login"
    fill_in 'email', with: 'sean@sean.com'
    fill_in 'password', with: 'password'
    within(".signup-form") do
      click_on("Login")
    end
    save_screenshot
    expect(page).to_not have_text("Login")
  end
end
