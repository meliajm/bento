class User < ApplicationRecord
  has_secure_password
  # has_many :menu_items
  # has_many :bentoboxes, through: :menu_items

  validates :name, presence: true
  validates :email, presence: true 
  validates :email, uniqueness: true

  # need any methods here? maybe in future
end
