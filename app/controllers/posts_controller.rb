class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to(root_path)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :image, :user_id)
  end
end