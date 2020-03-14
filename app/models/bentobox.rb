class Bentobox < ApplicationRecord
    has_many :menu_items
    has_many :users, through: :menu_items

end
