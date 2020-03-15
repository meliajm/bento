class Bentobox < ApplicationRecord
    has_many :menu_items
    # has_many :users, through: :menu_items
    
    validates :name, presence: true, uniqueness: true
    validates :bento_type, inclusion: { in: %w(Lunch Dinner) }

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
