class AddTimestampsToFinds < ActiveRecord::Migration
  def change
    add_column(:finds, :created_at, :datetime)
    add_column(:finds, :updated_at, :datetime)
  end
end
