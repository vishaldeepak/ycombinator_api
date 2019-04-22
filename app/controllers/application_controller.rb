class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorize_request
  before_action :setup_user

  private
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  def setup_user
    if @current_user.nil?
      begin
        @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
      rescue StandardError => error
        puts "#{error.inspect}"
      end
    end
  end
end
