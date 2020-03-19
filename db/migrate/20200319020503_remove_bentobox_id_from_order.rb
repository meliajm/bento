class RemoveBentoboxIdFromOrder < ActiveRecord::Migration[6.0]
  def change

    remove_column :orders, :bentobox_id, :integer
  end
end
