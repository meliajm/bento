class User < ApplicationRecord
  has_secure_password
  has_many :bentoboxes
  has_many :menu_items, through: bentoboxes

  # need any methods here? maybe in future
end
