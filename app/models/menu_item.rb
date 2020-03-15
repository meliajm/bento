class MenuItem < ApplicationRecord

    belongs_to :bentobox
    # belongs_to :user

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    validates :item_type, inclusion: { in: %w(Entree Side Snack Drink) }

    def self.order_array_by_item_type
        order(item_type: :asc)
    end

    def bento_name=(name)
        self.bentobox = Bentobox.find_or_create_by(name: name)
    end
    
    def bento_name
        self.bentobox ? self.bentobox.name : nil
    end
    
end
