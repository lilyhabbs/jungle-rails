class User < ActiveRecord::Base
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  validates :email, presence: true, uniqueness: { 
    case_sensitive: false,
    message: ->(user, data) do
      "#{data[:value]} is already taken."
    end
  }
  
  validates :password, length: { minimum: 8 }
  
  has_secure_password
  
end
