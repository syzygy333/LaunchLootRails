class AddEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|
      t.integer :user_id, null: false
      t.integer :quest_id, null: false
    end
  end
end
