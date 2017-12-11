require "rails_helper"

describe "post a message route", type: :request do
  let!(:group) { FactoryBot.create(:group) }
  let!(:user) { FactoryBot.create(:user) }

  before do
    post "/groups/#{group.id}/messages", params: { content: "War, war never changes."}
  end

  it "returns the quote content" do
    expect(JSON.parse(response.body)['content']).to eq("War, war never changes.")
  end

  it "returns the user id of the author" do
    expect(JSON.parse(response.body)['user_id']).to eq(user.id)
  end

  it "returns an unprocessable entity code if message can't be saved" do
    post "/groups/#{group.id}/messages"
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
