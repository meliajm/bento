class User < ApplicationRecord
  has_secure_password
  # has_many :menu_items
  # has_many :bentoboxes, through: :menu_items
  # need any methods here? maybe in future
end
