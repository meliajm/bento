class AddPickupDeliverToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :pickup_deliver, :string
  end
end
