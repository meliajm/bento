class Bentobox < ApplicationRecord

    has_many :bento_menu_items
    has_many :menu_items, through: :bento_menu_items
    belongs_to :user
    
    accepts_nested_attributes_for :menu_items
    accepts_nested_attributes_for :bento_menu_items, reject_if: proc { |attributes| attributes['quantity'] == '0'}

    validates :name, presence: true, uniqueness: true
    validates :bento_type, inclusion: { in: %w(Lunch Dinner) }
    
    def total_price
        # @budget.zip @actual
        tot = 0
        zipped_array = self.menu_items.zip(self.bento_menu_items)
        zipped_array.each do |menu_item, bento_menu_item|
            tot += menu_item.price * bento_menu_item.quantity
        end
        # self.menu_items.each do |menu_item|
            # menu_item.bento_menu_items.each do |bento_menu_item| 
                # tot += menu_item.price * bento_menu_item.quantity
                # binding.pry
        #     end
        # end
        tot
    end

    # def total_price
    #     # binding.pry
    #     self.number_of_sides * self.quantity_of_sides * 3 + self.number_of_entrees * self.quantity_of_entrees * 7 + self.number_of_snacks * self.quantity_of_snacks * 2 + self.number_of_drinks * self.quantity_of_drinks * 1  
    # end

    # def number_of_sides
    #     self.menu_items.count { |menu_item| menu_item.item_type == 'Side' }
    # end
        
    # def quantity_of_sides
    #     # binding.pry
    #     q_of_ = 0
    #     self.menu_items.where(item_type: "Side").each do |items|
    #         q_of_ += items.bento_menu_items.count { |bento_menu_item| bento_menu_item.quantity != 0 }
    #     end
    #     q_of_
    #     # self.bento_menu_items.menu_items.where(item_type: "Side")
    #     # count { |bento_menu_item| bento_menu_item.quantity != 0 }

    #     # self.menu_items.where(item_type: "Side").bento_menu_items.count { |bento_menu_item| bento_menu_item.quantity != 0 }
    # end

    # def number_of_entrees
    #     self.menu_items.count { |menu_item| menu_item.item_type == 'Entree' }
    # end

    # def quantity_of_entrees
    #     q_of_ = 0
    #     self.menu_items.where(item_type: "Entree").each do |items|
    #         q_of_ += items.bento_menu_items.count { |bento_menu_item| bento_menu_item.quantity != 0 }
    #     end
    #     q_of_
    # end


    # def number_of_snacks
    #     self.menu_items.count { |menu_item| menu_item.item_type == 'Snack' }
    # end

    # def quantity_of_snacks
    #     q_of_ = 0
    #     self.menu_items.where(item_type: "Snack").each do |items|
    #         q_of_ += items.bento_menu_items.count { |bento_menu_item| bento_menu_item.quantity != 0 }
    #     end
    #     q_of_ 
    # end

    # def number_of_drinks
    #     self.menu_items.count { |menu_item| menu_item.item_type == 'Drink' }
    # end

    # def quantity_of_drinks
    #     q_of_ = 0
    #     self.menu_items.where(item_type: "Drink").each do |items|
    #         q_of_ += items.bento_menu_items.count { |bento_menu_item| bento_menu_item.quantity != 0 }
    #     end
    #     q_of_
    # end
end
