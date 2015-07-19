class Item < ActiveRecord::Base
  has_many :finds
  has_many :current_owners, through: :finds, source: :user
  has_many :past_ownerships
  has_many :past_owners, through: :past_ownerships, source: :user

  validates :name, presence: true
  validates :rarity, presence: true
  validates :value, presence: true, numericality: { only_integer: true }

  include PgSearch
  pg_search_scope :search,
    :against => :name,
    :using => {
      :tsearch => { :prefix => true }
    }
end
