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
        expect(to_json['auth_token']).to_not be_nil
      end

      #This could be dried
      it 'returns status code of 200' do
        expect(response).to have_http_status(200)
      end
    end

    context "when the request is invalid" do
      let(:invalid_attributes) do
        {username: "dummyName", password: "wrongPassword"}.to_json
      end
      before { post '/auth/login', params: invalid_attributes, headers: headers}

      it "returns status code 422" do
        expect(response).to have_http_status(401)
      end

      it "returns a failure message" do
        expect(to_json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
