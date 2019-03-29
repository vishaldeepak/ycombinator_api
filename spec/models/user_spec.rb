require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid when all details are valid" do
    user = build(:user_proper)
    expect(user).to be_valid
  end

  it "is not valid without a username" do
    user = User.new();
    expect(user).to_not be_valid
  end

  describe "Associations" do
    it { should have_many(:posts) }
  end
end
