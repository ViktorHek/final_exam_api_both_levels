class Api::CommentsController < ApplicationController
  def create
    comment = Comment.create()
    binding.pry
    if comment.persisted? 
      redner json: { comment: comment }, status: 201
    else
      render json: {message: "ops" }, status: 422
    end
  end

  def index
  end

  private

  # def comment_params
  #   params.require(:comment).permit(:body, :index_comments_on_article_id)
  # end
end
