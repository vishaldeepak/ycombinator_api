require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  let!(:all_posts) { create_list(:post, 10) }
  let(:post_id) { all_posts.first.id }

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST /post" do
    let(:attributes) {{title: "This is a post", user_id: User.first.id}}

    context "when the request is valid" do
      before { post '/posts', params: attributes}

      it 'creates a post' do
        expect(to_json['title']).to eq('This is a post')
      end

      it 'returns status code of 201' do
        expect(response).to have_http_status(201)
      end
    end

    #invalidity checked mostly by post_spec
  end

  # describe "GET #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET /posts/:id" do
    before { get "/posts/#{post_id}" }

    context 'when the record exists' do
      it 'returns the post' do
        expect(to_json).not_to be_empty
        expect(to_json['id']).to eq(post_id)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when the record does not exist' do
      let(:post_id) {9999}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
