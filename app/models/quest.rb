class Quest < ActiveRecord::Base
  belongs_to :user
  # has_many :finds

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
end
