class Admin::DashboardController < ApplicationController
  def index
    
  end
  
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
