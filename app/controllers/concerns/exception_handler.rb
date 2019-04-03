module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  # class ExpiredSignature < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end


  included do
    rescue_from ExceptionHandler::AuthenticationError do |e|
      json_response({message: e.message}, :unauthorized)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    # rescue_from ExceptionHandler::ExpiredSignature do |e|
    #   json_response({ message: e.message }, :not_found)
    # end

    rescue_from ExceptionHandler::MissingToken, with: error_four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: error_four_twenty_two

  end

  def error_four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end
end