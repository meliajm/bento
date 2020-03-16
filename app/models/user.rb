class User < ApplicationRecord
  has_secure_password

  has_many :orders

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true 

  # need any methods here? maybe in future
end


