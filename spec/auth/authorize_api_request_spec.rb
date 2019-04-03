require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }

  let(:header) { {'Authorization' => token_generator(user.id)} }

  let(:valid_request_obj) { AuthorizeApiRequest.new(header)}

  let(:invalid_request_obj) { AuthorizeApiRequest.new()}

  describe '#call' do
    context 'when valid request' do
      it  'returns user object' do
        result = valid_request_obj.call
        expect(result[:user]).to eq(user)
      end
    end

    context 'when invalid request' do
      it 'raises missing token exception when missing token ' do
        expect {invalid_request_obj.call}.to raise_exception(ExceptionHandler::MissingToken, 'Missing Token')
      end

      it 'raises invalid token exception when tokens invalid' do
        invalid_obj_mis = AuthorizeApiRequest.new('Authorization' =>  token_generator(99))
        expect {invalid_obj_mis.call}.to raise_exception(ExceptionHandler::InvalidToken, /Invalid Token/)
      end

      it 'raises exception when tokens expried' do
        invalid_obj_mis = AuthorizeApiRequest.new('Authorization' => expired_token_generator(user.id))
        expect {invalid_obj_mis.call}.to raise_exception(ExceptionHandler::InvalidToken, /Signature has expired/)
      end


    end
  end

end