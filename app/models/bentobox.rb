class Bentobox < ApplicationRecord
    has_many :bento_menu_items
    has_many :menu_items, through: :bento_menu_items
    belongs_to :user
    
    accepts_nested_attributes_for :menu_items
    accepts_nested_attributes_for :bento_menu_items, reject_if: proc { |attributes| attributes['quantity'] == '0'}

    
    validates :name, presence: true, uniqueness: true
    validates :bento_type, inclusion: { in: %w(Lunch Dinner) }
    # validates :menu_items, :presence => true

    # def menu_item_ids=(ids)
    #     ids = ids[1..-1]
    #     ids.each do |id|
    #       menu_item = MenuItem.find(id) if id != ""
    #       self.menu_items << menu_item
    #     end
    # end

    #  need this ?
    # def bento_menu_items=(ids)
    #     ids = ids[1..-1]
    #     ids.each do |id|
    #       bento_menu_item = BentoMenuItem.find(id) if id != ""
    #       self.bento_menu_items << bento_menu_item
    #     end
    # end

    # def bento_menu_items_attributes=(info_hash)
    #     binding.pry
    # end

    def total_price
        self.number_of_sides * 3 + self.number_of_entrees * 7 + self.number_of_snacks * 2 + self.number_of_drinks * 1  
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
