class CreateBentoboxMenuItemJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :bento_menu_items do |t|
      t.integer :bentobox_id
      t.integer :menu_item_id

      t.timestamps
    end
  end
end
