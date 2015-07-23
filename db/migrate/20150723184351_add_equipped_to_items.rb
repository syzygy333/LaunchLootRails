class AddEquippedToItems < ActiveRecord::Migration
  def change
    add_column(:items, :equipped?, :boolean, default: false)
  end
end
