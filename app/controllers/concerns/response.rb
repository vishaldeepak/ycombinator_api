#A generalized module for generating json responses
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end