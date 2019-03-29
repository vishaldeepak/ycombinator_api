require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:all_posts) { create_list(:post, 10) }
  let(:post_id) { all_posts.first.id }

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end

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
    before { get :show, params: {id: post_id} }

    context 'when the record exists' do
      it 'returns the post' do
        expect(to_json).not_to be_empty
        expect(to_json['id']).to eq(post_id)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
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
