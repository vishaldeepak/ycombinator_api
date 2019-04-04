require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe "POST /signup" do
    context "when the request is valid" do
      let(:valid_params) do
        {username: 'testUser', password: 'testPassword' }.to_json
      end
      let(:headers) do
        { "Content-Type" => "application/json" }
      end

      before { post '/signup', params: valid_params, headers: headers}

      it "should create a new user with correctly" do
        expect(User.last.username).to eq('testUser')
      end

      it "returns an authentication token" do
        expect(get_json['auth_token']).not_to be_nil
      end

      it_behaves_like "status created respsone"
    end

    context "when the request is invalid" do
      before { post '/signup', headers: headers, params: {}}

      it "does not create a new user" do
        expect(User.count).to eq(0)
      end

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end
end
