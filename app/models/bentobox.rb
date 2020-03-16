class Bentobox < ApplicationRecord
    has_many :bento_menu_items
    has_many :menu_items, through: :bento_menu_items
    
    # belongs_to :order
    # 
    accepts_nested_attributes_for :menu_items

    
    validates :name, presence: true, uniqueness: true
    validates :bento_type, inclusion: { in: %w(Lunch Dinner) }

    def menu_item_ids=(ids)
        ids = ids[1..-1]
        ids.each do |id|
          menu_item = MenuItem.find(id) if id != ""
          self.menu_items << menu_item
        end
    end

    def total_price
        self.number_of_sides * 3 + self.number_of_entrees * 7 + self.number_of_snacks * 2 + self.number_of_drinks  
    end

    def number_of_sides
        self.menu_items.count { |menu_item| menu_item.item_type == 'Side' }
    end

    def number_of_entrees
        self.menu_items.count { |menu_item| menu_item.item_type == 'Entree' }
    end

    def number_of_snacks
        self.menu_items.count { |menu_item| menu_item.item_type == 'Snack' }
    end

    def number_of_drinks
        self.menu_items.count { |menu_item| menu_item.item_type == 'Drink' }
    end
end
