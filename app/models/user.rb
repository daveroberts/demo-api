class User < ActiveRecord::Base
  attr_accessible :password, :password_digest, :username
  has_secure_password
  validates_presence_of :password, on: :create
end
