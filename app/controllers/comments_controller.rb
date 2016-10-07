class CommentsController < ApplicationController
  before_filter :authorize

  def create
      @comment = Comment.new(comment_params)
      @comment.save
      render :json => { :status => 201, :message => "Successfully Added Comment" }
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user)
  end
end
