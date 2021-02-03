class Api::CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    if comment.persisted? 
      render json: { comment: comment, message: "your comment was successfully created" }, status: 201
    else
      render json: {message: "ops" }, status: 422
    end
  end

  def index
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
