require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Validation" do
    it "must be created with password and password confirmation" do
      @user = User.new(first_name: "Sean", last_name: "Oyler", email: "sean@gmail.com", password: "password123", password_confirmation: "password123")
      expect(@user.password).to be_present
      expect(@user.password_confirmation).to be_present
    end

    it "Passowrd and password confirmation should match" do
      @user = User.new(first_name: "Sean", last_name: "Oyler", email: "sean@gmail.com", password: "password123", password_confirmation: "password124")
      expect(@user).to_not be_valid
    end

    it "Must contain a first name" do
      @user = User.new(first_name: "Sean", last_name: nil, email: nil, password: nil, password_confirmation: nil)
      expect(@user.first_name).to be_present
      expect(@user).to_not be_valid
    end

    it "Must contain a last name" do
      @user = User.new(first_name: nil, last_name: "Oyler", email: nil, password: nil, password_confirmation: nil)
      expect(@user.last_name).to be_present
      expect(@user).to_not be_valid
    end

    it "must contain an e-mail address" do
      @user = User.new(first_name: nil, last_name: nil, email: "sean@gmail.com", password: nil, password_confirmation: nil)
      expect(@user.email).to be_present
      expect(@user).to_not be_valid
    end

    it "Email address must be unique" do
      User.create!(first_name: "Sean", last_name: "Oyler", email: "sean@sean.com", password: "password", password_confirmation: "password")
      @user = User.new(first_name: "Sean", last_name: "Doe", email: "sean@sean.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.messages).to include(email: ["Email already exists"])
    end

    it "password must have a minimum length greater than 3" do
      @user = User.new(first_name: "Sean", last_name: "Oyler", email: "sean@gmail.com", password: "pas", password_confirmation: "pas")
      
      expect(@user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    it "Should log in with valid credentials" do
      User.create!(first_name: "Sean", last_name: "Oyler", email: "sean@sean.com", password: "password", password_confirmation: "password")
      user = User.authenticate_with_credentials("sean@sean.com", "password")
      expect(user).to be_truthy
    end

    it "should not log in with invalid credentials" do
      User.create!(first_name: "Sean", last_name: "Oyler", email: "sean@sean.com", password: "password", password_confirmation: "password")
      user = User.authenticate_with_credentials("sean@sean.com", "password123")
      expect(user).to be_falsey
    end

    it "email should be case insensitive" do
      User.create!(first_name: "Sean", last_name: "Oyler", email: "sean@sean.com", password: "password", password_confirmation: "password")
      user = User.authenticate_with_credentials("sEaN@sean.com", "password")
      expect(user).to be_truthy
    end

    it "white space around email should not matter" do
      User.create!(first_name: "Sean", last_name: "Oyler", email: "sean@sean.com", password: "password", password_confirmation: "password")
      user = User.authenticate_with_credentials(" sEaN@sean.com  ", "password")
      expect(user).to be_truthy
    end
      
  end
end
