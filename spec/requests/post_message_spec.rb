require "rails_helper"

describe "post a message route", type: :request do
  let!(:group) { FactoryBot.create(:group) }
  let!(:user) { FactoryBot.create(:user) }

  before do
    post "/api/v1/authenticate", params: { key: user.api_key.access_token, email: user.email, password: user.password }
    auth_token = JSON.parse(response.body)["auth_token"]
    post "/api/v1/groups/#{group.id}/messages", params: { key: user.api_key.access_token, content: "War, war never changes."}, headers: { Authorization: auth_token}
  end

  it "returns the quote content" do
    expect(JSON.parse(response.body)['content']).to eq("War, war never changes.")
  end

  it "returns the user id of the author" do
    expect(JSON.parse(response.body)['user_id']).to eq(user.id)
  end

  it "returns a created code" do
    expect(response).to have_http_status(:created)
  end

  it "returns an unprocessable entity code if message can't be saved" do
    post "/api/v1/authenticate", params: { key: user.api_key.access_token, email: user.email, password: user.password }
    auth_token = JSON.parse(response.body)["auth_token"]
    post "/api/v1/groups/#{group.id}/messages", params: { key: user.api_key.access_token }, headers: { Authorization: auth_token}
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
