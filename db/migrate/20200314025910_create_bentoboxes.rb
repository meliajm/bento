class CreateBentoboxes < ActiveRecord::Migration[6.0]
  def change
    create_table :bentoboxes do |t|
      t.string :name
      t.string :bento_type
      

      t.timestamps
    end
  end
end
