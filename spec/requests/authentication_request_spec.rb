require 'rails_helper'

RSpec.describe 'Auth API', type: :request do
  let!(:user) { create(:user)}

  describe "POST /auth/login" do
    let(:attributes) do
      {username: user.username, password: user.password}.to_json
    end
    let(:headers) { valid_headers.except('Authorization') }

    context "when the request is valid" do
      before { post '/auth/login', params: attributes, headers: headers}

      it "should return a valid token" do
        expect(get_json['token']).to_not be_nil
      end

      it "should return a valid user_id" do
        expect(get_json['userId']).to be(user.id)
      end

      it_behaves_like "status ok respsone"
    end

    context "when the request is invalid" do
      let(:invalid_attributes) do
        {username: "dummyName", password: "wrongPassword"}.to_json
      end
      before { post '/auth/login', params: invalid_attributes, headers: headers}

      it "returns status code 401" do
        expect(response).to have_http_status(401)
      end

      it "returns a failure message" do
        expect(get_json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
