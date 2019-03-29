class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]


  def new
  end

  def create
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
end
