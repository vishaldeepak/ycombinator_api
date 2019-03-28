require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a username" do
    user = User.new();
    expect(user).to_not be_valid
  end
end
