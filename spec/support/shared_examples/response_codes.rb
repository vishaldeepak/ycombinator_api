RSpec.shared_examples "status ok respsone" do
  it { expect(response).to have_http_status(200) }
end

RSpec.shared_examples "status created respsone" do
  it { expect(response).to have_http_status(201) }
end

RSpec.shared_examples "status code 404" do
  it { expect(response).to have_http_status(404) }
end