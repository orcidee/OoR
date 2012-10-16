class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email_address, :password, :password_confirmation, :role, :username
  
  validates :email_address, uniqueness: true
  validates :username, uniqueness: true
  
  # Class methods
  class << self
    
    def find_by_login(login)
      self.find_by_email_address(login) || self.find_by_username(login)
    end
    
  end
end
