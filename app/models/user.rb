class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile

  accepts_nested_attributes_for :profile

  delegate :username, :twitter_username, :real_name, :bio, :website, :country, to: :profile
end
