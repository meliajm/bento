class Order < ApplicationRecord
    belongs_to :user
    has_many :bento_orders
    has_many :bentoboxes, through: :bento_orders
    accepts_nested_attributes_for :bentoboxes

    def order_price
    end

end
