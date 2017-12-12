require "rails_helper"

describe "authenticate a user route", type: :request do
  let!(:user) { FactoryBot.create(:user) }

  before do
    post "/api/v1/authenticate", params: { key: user.api_key.access_token, email: user.email, password: user.password }
  end

  it "returns the user's auth_token if credentials are correct" do
    expect(JSON.parse(response.body)["auth_token"]).not_to eq(nil)
  end

  it "returns a success code" do
    expect(response).to have_http_status(:success)
  end

  it "does not authenticate if credentials are incorrect" do
    post "/api/v1/authenticate", params: { key: user.api_key.access_token, email: user.email, password: "potato" }
    expect(response).to have_http_status(:unauthorized)
  end
end
