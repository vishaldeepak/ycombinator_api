class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, raise: false

  def authenticate
    strong_params = auth_params
    resposnse = AuthenticateUser.call(strong_params[:username], strong_params[:password])
    json_response(resposnse)
  end

  private
  def auth_params
    params.permit(:username, :password)
  end
end
