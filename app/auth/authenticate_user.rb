class AuthenticateUser
  def self.call(username, password)
    user = User.find_by(username: username)
    return JsonWebToken.encode(user_id: user.id) if user && user.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, 'Invalid credentials')
  end
end