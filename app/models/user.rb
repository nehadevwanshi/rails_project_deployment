class User < ActiveRecord::Base
  has_secure_password

  has_many :secrets
  has_many :likes, dependent: :destroy 
  has_many :secrets_liked, through: :likes, source: :secret

  eamil_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :presence => true 

  validates :email, :presence => true, :format => {:with => eamil_regex}, :uniqueness => {:case_sensitive => false}

  validates :password, :presence => true

  #validates :login, :presence => true
end
