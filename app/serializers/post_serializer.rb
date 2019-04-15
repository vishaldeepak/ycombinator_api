class PostSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  set_id :id
  attributes :title, :url, :created_at, :user_id

  attribute :created_by do |object|
    "#{object.user.username}"
  end

  belongs_to :user
end
