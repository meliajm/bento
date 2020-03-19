class AddQuantityToBentoMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_column :bento_menu_items, :quantity, :integer, :default => 0
  end
end
