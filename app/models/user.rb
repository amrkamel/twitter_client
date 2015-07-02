class User < ActiveRecord::Base
  # with the next two lines you can directly get any user gravatar url through user.gravatar_url
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :tweets, dependent: :destroy

  accepts_nested_attributes_for :profile

  delegate :username, :twitter_username, :real_name, :bio, :website, :country, to: :profile
end
