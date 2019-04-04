class UsersController < ApplicationController
  skip_before_action :authorize_request, raise: false

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.call(user.username, user.password)
    json_response({message: "Account Created Successfully", auth_token: auth_token}, :created)
  end

  private
  def user_params
    params.permit(:username, :password)
  end
end
