class User < ActiveRecord::Base
  
  has_secure_password
  validates_uniqueness_of :email, message: "Email already exists", :case_sensitive => false
  validates :password,
  presence: true,
  confirmation: true,
  length: { within: 4..40 }
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end



