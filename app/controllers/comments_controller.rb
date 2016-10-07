class CommentsController < ApplicationController
  before_filter :authorize

  def create
    @role = session[:role]
    if @role
      @comment = Comment.new(comment_params)
      @comment.save
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user)
  end
end
