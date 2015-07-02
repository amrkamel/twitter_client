class User < ActiveRecord::Base
  # with the next two lines you can directly get any user gravatar url through user.gravatar_url
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :fellowships, foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :fellowships, source: 'followed'

  accepts_nested_attributes_for :profile

  delegate :username, :twitter_username, :real_name, :bio, :website, :country, to: :profile

  def follow(followed)
    fellowships.new(followed: followed)
  end

  def unfollow(followed)
    fellowships.where(followed: followed).first.try(:destroy)
  end

  def followed_by
    Fellowship.where(followed: self)
  end
end
