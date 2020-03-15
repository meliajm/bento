class Order < ApplicationRecord
    belongs_to :user
    has_many :bentoboxes
    has_many :menu_items, through: :bentoboxes

end
