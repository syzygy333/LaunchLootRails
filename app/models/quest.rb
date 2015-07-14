class Quest < ActiveRecord::Base
  has_many :engagements
  has_many :users, through: :engagements
  has_many :finds

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
