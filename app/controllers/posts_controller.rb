class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.all
  end

  def new
    # not actually needed since we are not providing values for erb
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      @errors = @post.errors.full_messages
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # post action
  end

  def delete
    # GET form
  end

  def destroy
    # post action
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
