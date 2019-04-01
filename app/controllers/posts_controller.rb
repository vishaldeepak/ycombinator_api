class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]


  def new
  end

  def create
    @post = Post.create!(post_params)
    render json: @post, status: :ok
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    render json: @post, status: :ok
  end

  def index
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
