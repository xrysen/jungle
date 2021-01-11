require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "Validation" do

    it "creates a new product succesfully" do
      @category = Category.new(name: "Furniture")
      @product = Product.new(name: "Desk Chair", price: 199, quantity: 100, category: @category)
      expect(@product).to be_valid
    end

    it "contains a name" do
      @product = Product.new(name: "Desk Chair", price: nil, quantity: nil, category: nil)
      expect(@product.name).to be_present 
      expect(@product).to_not be_valid
      expect(@product.errors.messages).to include(category: ["can't be blank"], price: ["is not a number", "can't be blank"], quantity: ["can't be blank"])
    end

    it "contains a price" do
      
      @product = Product.new(name: nil, price: 199, quantity: nil, category: nil)
      expect(@product.price).to be_present
      expect(@product).to_not be_valid
      expect(@product.errors.messages).to include(category: ["can't be blank"], name: ["can't be blank"], quantity: ["can't be blank"])
    end

    it "contains a quantity" do
      
      @product = Product.new(name: nil, price: nil, quantity: 100, category: nil)
      expect(@product.quantity).to be_present
      expect(@product).to_not be_valid
      expect(@product.errors.messages).to include(category: ["can't be blank"], price: ["is not a number", "can't be blank"], name: ["can't be blank"])
    end

    it "has a category" do
      @category = Category.new(name: "Furniture")
      @product = Product.new(name: nil, price: nil, quantity: nil, category: @category)
      expect(@product.category).to be_present
      expect(@product).to_not be_valid
      expect(@product.errors.messages).to include(name: ["can't be blank"], price: ["is not a number", "can't be blank"], quantity: ["can't be blank"])
    end

  end
end
