class CreateBentoboxOrderJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :bento_orders do |t|
      t.integer :bentobox_id
      t.integer :order_id

      t.timestamps
    end
  end
end
