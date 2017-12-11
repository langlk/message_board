require "rails_helper"

describe User do
  it { should have_many :messages }

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :name }
  it { should validate_uniqueness_of :email }
end
