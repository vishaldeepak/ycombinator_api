class PostSerializer
  include FastJsonapi::ObjectSerializer

  extend ActionView::Helpers::DateHelper

  set_key_transform :camel_lower

  set_id :id
  attributes :title, :url, :created_at, :user_id

  attribute :created_by do |object|
    "#{object.user.username}"
  end

  attribute :created_at do |object|
    "#{time_ago_in_words(object.created_at)} ago"
  end

  attribute :user_upvoted_post do |object, params|
    if params[:user_upvoted_posts]
      params[:user_upvoted_posts].include? object.id
    else
      false
    end
  end

  belongs_to :user
end
