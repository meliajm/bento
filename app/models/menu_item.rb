class MenuItem < ApplicationRecord
    has_many :bento_menu_items
    has_many :bentoboxes, through: :bento_menu_items

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    validates :price, numericality: { only_integer: true }

    validates :item_type, inclusion: { in: %w(Entree Side Snack Drink) }

    def self.order_array_by_item_type
        order(item_type: :asc)
    end

    def self.search(query)
        if query.present?
          where('NAME like ?', "%#{query}%")
        else
          self.all
        end
    end

end
