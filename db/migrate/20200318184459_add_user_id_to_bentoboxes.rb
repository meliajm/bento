class AddUserIdToBentoboxes < ActiveRecord::Migration[6.0]
  def change
    add_column :bentoboxes, :user_id, :integer
  end
end
