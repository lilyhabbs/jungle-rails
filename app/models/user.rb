class User < ActiveRecord::Base

  validates :name, presence: true

  validates :email, presence: true, uniqueness: { 
    case_sensitive: false,
    message: ->(user, data) do
      "#{data[:value]} is already taken."
  end
  }

  has_secure_password
  
end
