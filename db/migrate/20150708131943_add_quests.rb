class AddQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :title, null: false
      t.text :description
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
