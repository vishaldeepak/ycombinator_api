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

  describe 'PUT /posts/:id' do
    let(:valid_attributes) { { title: 'Updated Post' } }

    context 'when the record exists' do
      before { put "/posts/#{post_id}", params: valid_attributes }

      it 'updates the record' do
        expect(Post.find(post_id).title).to eq('Updated Post')
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /posts/:id' do
    # let(:post_new_id) { create(:post).id }
    before { delete "/posts/#{post_id}"}

    it 'deletes the post' do
      expect(Post.find_by(id: post_id)).to be_nil
      expect(Post.count).to eq(9)
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

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
