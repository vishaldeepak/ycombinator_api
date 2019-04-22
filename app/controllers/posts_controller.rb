class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy, :vote, :unvote]
  skip_before_action :authorize_request, only: [:index, :show], raise: false

  def create
    @post = Post.create!(post_params)
    render json: @post, status: :created
  end

  def destroy
    @post.destroy
    head :no_content
  end

  def index
    #Change implementation to something else other than new
    @posts = Post.includes(:user).created_order.limit(30)
    user_upvoted_posts = @current_user.get_up_voted(Post).where(id: @posts.map(&:id)).pluck(:id) if @current_user
    render json: PostSerializer.new(@posts, {params: {user_upvoted_posts: user_upvoted_posts}}).serialized_json, status: :ok
  end

  def show
    render json: @post, status: :ok
  end

  def update
    @post.update(post_params)
    head :no_content
  end

  def vote
    user = User.find(params[:user_id])
    @post.upvote_by user
    render json: "User vote registered", status: :ok
  end

  def unvote
    user = User.find(params[:user_id])
    @post.unvote_by user
    render json: "User vote removed", status: :ok
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    #Needs to be changed after implementing login
    params.permit(:title, :user_id)
  end
end
