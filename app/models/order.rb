class Order < ApplicationRecord
    belongs_to :user
    has_many :bentoboxes
    has_many :menu_items, through: :bentoboxes
    accepts_nested_attributes_for :bentoboxes

end
