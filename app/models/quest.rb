class Quest < ActiveRecord::Base
  has_many :users
  # has_many :finds

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
end
