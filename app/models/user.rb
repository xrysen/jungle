class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, message: "Email already exists", :case_sensitive => false
end
