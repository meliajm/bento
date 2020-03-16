class BentoMenuItem < ApplicationRecord
    belongs_to :bentobox
    belongs_to :menu_item
    # bento_menu_items
end

