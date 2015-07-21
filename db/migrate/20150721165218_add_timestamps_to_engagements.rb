class AddTimestampsToEngagements < ActiveRecord::Migration
  def change
    add_column(:engagements, :created_at, :datetime)
    add_column(:engagements, :updated_at, :datetime)
  end
end
