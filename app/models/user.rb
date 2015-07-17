class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :engagements
  has_many :quests, through: :engagements
  has_many :finds
  # has_many :comments
  has_many :current_items, through: :finds, source: :item
  # has_many :past_ownerships
  # has_many :past_items through: :past_ownerships, source: item

  validates :first_name, presence: true
  validates :last_name, presence: true
end
