require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid when all details are valid" do
    post = build(:post_proper)
    expect(post).to be_valid
  end

  it "is not valid without a user" do
    post = Post.new(title: "test post")
    expect(post).to_not be_valid
  end

  it "is not valid without a title" do
    post = Post.new(user_id: 1)
    expect(post).to_not be_valid
  end


  it "is not valid when title length is less than 7 character" do
    post = build(:post, title: "small")
    expect(post).to_not be_valid

    post = build(:post, title: "small    ")
    expect(post).to_not be_valid
  end

  it "is not valid when url is invalid" do
    post = build(:post, url: "random")
    expect(post).to_not be_valid

    post = build(:post, url: "      ")
    expect(post).to_not be_valid
  end

  it "is not valud when user is invalid" do
    post = Post.new(user_id: nil)
    expect(post).to_not be_valid

    post = Post.new(user_id: 4)
    expect(post).to_not be_valid
  end

  it "should belong to the approiate user" do
    user = build(:user)
    user1 = build(:user)

    post = build(:post, user_id: user.id)
    expect(post.user_id).to eq(user.id)
  end

  describe "Associations" do
    it { should belong_to(:user) }
  end
end
