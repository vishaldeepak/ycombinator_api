RSpec.shared_examples "status ok respsone" do
  it { expect(response).to have_http_status(200) }
end

RSpec.shared_examples "status created respsone" do
  it { expect(response).to have_http_status(201) }
end

RSpec.shared_examples "a authorized action" do
  context "when the token is invalid" do
    before {

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