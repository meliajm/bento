class BentoOrder < ApplicationRecord
    belongs_to :bentobox
    belongs_to :order

    # bento_orders 

end
