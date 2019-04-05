RSpec.shared_examples "a authorized action" do
  context "when the token is invalid" do
    before {
      #Can be improved with send()
      case action_verb
      when :get
        get action_path, headers: invalid_headers
      when :post
        post action_path, params: parameters, headers: invalid_headers
      when :put
        put action_path, params: parameters, headers: invalid_headers
      when :delete
        delete action_path, headers: invalid_headers
      end
    }

    it "returns status code 422" do
      expect(response).to have_http_status(422)
    end
  end
end