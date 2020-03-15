class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :bentoboxes, through: :orders
  has_many :menu_items, through: :bentoboxes


  validates :name, presence: true
  validates :email, presence: true, uniqueness: true 

  # need any methods here? maybe in future
end


