require "rails_helper"

describe Group do
  it { should have_many :messages }

  it { should validate_presence_of :name }
end
