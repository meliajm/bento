class Bentobox < ApplicationRecord

    has_many :bento_menu_items
    has_many :menu_items, through: :bento_menu_items
    belongs_to :user
    
    accepts_nested_attributes_for :menu_items
    accepts_nested_attributes_for :bento_menu_items, reject_if: proc { |attributes| attributes['quantity'] == '0'}

    validates :name, presence: true, uniqueness: true
    validates :bento_type, inclusion: { in: %w(Lunch Dinner) }
    
    def total_price
        tot = 0
        zipped_array = self.menu_items.zip(self.bento_menu_items)
        zipped_array.each do |menu_item, bento_menu_item|
            tot += menu_item.price * bento_menu_item.quantity
        end
        tot
    end

end
