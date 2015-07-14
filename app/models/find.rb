class Find < ActiveRecord::Base
  belongs_to :quest
  belongs_to :item
  belongs_to :user
  # has_many :comments

  validates :quest, presence: true
  validates :item, presence: true
  validates :user, presence: true
end
