class AddFinds < ActiveRecord::Migration
  def change
    create_table :finds do |t|
      t.integer :quest_id, null: false
      t.integer :item_id, null: false
      t.integer :user_id, null: false
    end
  end
end
