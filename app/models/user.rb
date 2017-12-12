class User < ActiveRecord::Base
  has_one :api_key
  has_secure_password
  has_many :messages

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

  after_create :create_api_key

  def create_api_key
    self.api_key = ApiKey.new(user: self)
  end
end
