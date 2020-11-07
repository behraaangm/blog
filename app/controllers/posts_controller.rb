class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to action: :index
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'Post edited successfully'
      redirect_to action: :index
    else
      flash[:alert] = @post.errors.full_messages
      redirect_to action: :edit, id: params[:id]
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, tag_ids: [])
  end
end
