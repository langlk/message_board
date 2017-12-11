require "rails_helper"

describe Message do
  it { should belong_to :user }
  it { should belong_to :group }

  it { should validate_presence_of :user }
  it { should validate_presence_of :group }
  it { should validate_presence_of :content }
end
