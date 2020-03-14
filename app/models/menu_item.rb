class MenuItem < ApplicationRecord

    belongs_to :bentobox
    # belongs_to :user

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :price, presence: true
    validates :item_type, inclusion: { in: %w(Entree Side Snack Drink) }


    

    # def order_array_by_entree_first
    #     if self.item_type == "Entree"
    #         change.sort { |a, b| a <=> b }

    # end



    # methods to add in later
    
    # def make_order
    # end

    # def pay_for_order
    # end
end
