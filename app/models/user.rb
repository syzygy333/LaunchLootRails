class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :engagements
  has_many :quests, through: :engagements
  # has_many :comments
  # has_many :finds
  # has_many :current_items through: :finds, source: item
  # has_many :past_ownerships
  # has_many :past_items through: :past_ownerships, source: item

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
  end
end
end
