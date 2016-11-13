class PostsController < ApplicationController
  before_filter :authorize

  def new
    @role = session[:role]
    if @role != 'admin'
      redirect_to '/'
    end
  end

  def create
    @role = session[:role]
    if @role == 'admin'
      @post = Post.new(post_params)
      @post.save
      redirect_to '/'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
