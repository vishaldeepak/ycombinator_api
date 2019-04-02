class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

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
    @posts = Post.created_order.limit(10)
    render json: @posts, status: :ok
  end

  def show
    render json: @post, status: :ok
  end

  def update
    @post.update(post_params)
    head :no_content
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
