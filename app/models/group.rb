class Group < ActiveRecord::Base
  has_many :messages

  validates_presence_of :name
end
