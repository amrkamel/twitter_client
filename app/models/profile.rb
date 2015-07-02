class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :country

  validates_presence_of :username, :real_name
  validates_uniqueness_of :username, :user
  validates :website, format: { with: URI.regexp }, if: Proc.new { |p| p.website.present? }
  validates :country, presence: true, if: Proc.new { |p| p.country_id.present? }

  # a different method used than the username getter because changing the getter fails the uniqueness validation
  def twitter_username
    # using "and" for username method not to crash is self[:username] was nil
    self[:username] and '@' + self[:username]
  end
end
