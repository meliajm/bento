class Order < ApplicationRecord
    belongs_to :user
    has_many :bento_orders
    has_many :bentoboxes, through: :bento_orders
    accepts_nested_attributes_for :bentoboxes

    validates :bentoboxes, presence: true
    validates :pickup_deliver, presence: true
    
    def order_price
        price = 0
        self.bentoboxes.each { |bento| price += bento.total_price}
        price
    end

end
