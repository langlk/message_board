require "rails_helper"

describe "get a group route", type: :request do
  let!(:group) { FactoryBot.create(:group) }
  let!(:user) { FactoryBot.create(:user) }

  before { get "/api/v1/groups/#{group.id}", params: { key: user.api_key.access_token } }

  it 'returns the correct group' do
    expect(JSON.parse(response.body)["name"]).to eq(group.name)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
