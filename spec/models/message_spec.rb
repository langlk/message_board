require "rails_helper"

describe Message do
  it { should belong_to :user }
  it { should belong_to :group }

  it { should validate_presence_of :user }
  it { should validate_presence_of :group }
  it { should validate_presence_of :content }

  describe '.chronological' do
    it "returns messages from first to last created" do
      message1 = FactoryBot.create(:message)
      message2 = FactoryBot.create(:message, user: message1.user, group: message1.group)
      message3 = FactoryBot.create(:message, user: message1.user, group: message1.group)
      message4 = FactoryBot.create(:message, user: message1.user, group: message1.group)
      message4.update(content: "War Never Changes")
      expect(Message.chronological).to eq([message1, message2, message3, message4])
    end
  end
end
