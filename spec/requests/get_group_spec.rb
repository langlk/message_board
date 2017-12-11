require "rails_helper"

describe "get a group route", type: :request do
  let!(:group) { FactoryBot.create(:group) }

  before { get "/groups/#{group.id}" }

  it 'returns the correct group' do
    expect(JSON.parse(response.body)["name"]).to eq(group.name)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
