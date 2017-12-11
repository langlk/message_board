require "rails_helper"

describe "get a group's messages route", type: :request do
  let!(:group) { FactoryBot.create(:group) }
  let!(:user) { FactoryBot.create(:user)}
  let!(:message) { FactoryBot.create_list(:message, 10, group: group, user: user) }

  before { get "/groups/#{group.id}/messages" }

  it "returns a list of a groups messages" do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end
end
