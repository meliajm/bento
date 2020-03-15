class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.integer :price
      t.string :item_type
      # t.integer :user_id
      t.integer :bentobox_id
      t.timestamps
    end
  end
end
