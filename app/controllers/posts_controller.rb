class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.all
    @posts = @posts.sort{ |a, b| a.id <=> b.id }
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

  def new
    # not actually needed since we are not providing values for erb
    # would be needed if used form autofill in ruby
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(title: params[:title], body: params[:body])

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
