class Order < ApplicationRecord
    belongs_to :user
    has_many :bento_orders
    has_many :bentoboxes, through: :bento_orders
    accepts_nested_attributes_for :bentoboxes

    def order_price
        price = 0
        self.bentoboxes.each { |bento| price += bento.total_price}
        price
    end

    def bentobox_ids=(ids)
        ids = ids[1..-1]
        ids.each do |id|
            bentobox = Bentobox.find(id) if id != ""
          self.bentoboxes << bentobox
        end
    end

end
