# spec/support/request_spec_helper
module RequestSpecHelper
  # Parse JSON response to ruby hash
  def get_json
    JSON.parse(response.body)
  end
end