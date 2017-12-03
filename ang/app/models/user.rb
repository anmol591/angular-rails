require 'bcrypt'
class User < ApplicationRecord
include BCrypt

def self.test_password(password, hash)
  BCrypt::Password.new(hash) == password
end
  
	scope :is_active, -> { where(is_active: true) }
	scope :admin_approved, -> { where(admin_approved: true) }
	
end
