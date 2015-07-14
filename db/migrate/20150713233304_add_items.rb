class AddItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :rarity, null: false
      t.integer :value, null: false
    end
  end
end
