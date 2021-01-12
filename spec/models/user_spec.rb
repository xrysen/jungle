require 'rails_helper'

#params.require(:user).permit(:name, :email, :password, :password_confirmation)

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

    #-- Come back to this
    it "Must use unique email when signing up" do
      @user = User.new(first_name: "Sean", last_name: "Oyler", email: "sean@gmail.com", password: "password123", password_confirmation: "password123")
      email = @user.email.downcase
      expect(User.where(email: email)).to_not exist
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

    it "password must have a minimum length greater than 3" do
    end
  end
end
