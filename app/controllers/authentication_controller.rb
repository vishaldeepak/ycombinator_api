class AuthenticationController < ApplicationController
  def authenticate
    strong_params = auth_params
    token = AuthenticateUser.call(strong_params[:username], strong_params[:password])
    json_response(auth_token: token)
  end

  private
  def auth_params
    params.permit(:username, :password)
  end
end
