class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates_presence_of :user, :group, :content

  before_create :add_username

  scope :timeframe, -> (start_time, end_time) { where('created_at >= ? AND created_at < ?', start_time, end_time) }

  def add_username
    self.username = user.name
  end
end
