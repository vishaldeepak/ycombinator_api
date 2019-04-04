require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  let!(:all_posts) { create_list(:post, 10) }
  let(:post_id) { all_posts.first.id }
  let(:user) {User.first}

  describe "POST /post" do
    let(:attributes) do
      {title: "This is a post", user_id: user.id}.to_json
    end

    context "when the request is valid" do
      before { post '/posts', params: attributes, headers: valid_headers}

      it 'creates a post' do
        expect(get_json['title']).to eq('This is a post')
      end

      it_behaves_like "status created respsone"
    end

    it_behaves_like "a authorized action" do
      let(:action_verb) {:post}
      let(:action_path) {"/posts"}
      let(:parameters) {attributes}
    end
  end

  describe 'PUT /posts/:id' do
    let(:valid_attributes) do
      { title: 'Updated Post' }.to_json
    end

    context 'when the record exists' do
      before { put "/posts/#{post_id}", params: valid_attributes, headers: valid_headers}

      it 'updates the record' do
        expect(Post.find(post_id).title).to eq('Updated Post')
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    it_behaves_like "a authorized action" do
      let(:action_verb) {:put}
      let(:action_path) {"/posts/#{post_id}"}
      let(:parameters) {valid_attributes}
    end
  end

  describe 'DELETE /posts/:id' do
    context "when the record exists" do
      before { delete "/posts/#{post_id}", headers: valid_headers}

      it 'deletes the post' do
        expect(Post.find_by(id: post_id)).to be_nil
        expect(Post.count).to eq(9)
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    it_behaves_like "a authorized action" do
      let(:action_verb) {:delete}
      let(:action_path) {"/posts/#{post_id}"}
    end
  end

  describe "GET /posts/:id" do
    before { get "/posts/#{post_id}" }

    context 'when the record exists' do
      it 'returns the post' do
        expect(get_json).not_to be_empty
        expect(get_json['id']).to eq(post_id)
      end

      it_behaves_like "status ok respsone"
    end

    context 'when the record does not exist' do
      let(:post_id) {9999}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
