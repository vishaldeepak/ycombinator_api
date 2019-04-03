require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) {create(:user) }

  describe '#call' do
    context 'when credentials are valid' do
      it 'returns a auth token' do
        token = AuthenticateUser.call(user.username, user.password)
        expect(token).not_to be_nil
      end
    end

    context 'when credentials are invalid' do
      it 'raises an authentication error' do
        expect {AuthenticateUser.call('fail','user')}.to raise_exception(ExceptionHandler::AuthenticationError,
        /Invalid credentials/)
      end
    end


  end
end