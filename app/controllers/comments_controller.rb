class CommentsController < ApplicationController
  def create

    @the_comment = Comment.new

    @the_comment.photo_id = params.fetch("query_photo_id")
    @the_comment.body = params.fetch("query_comment")
    @the_comment.author_id = params.fetch("query_author_id")

    @the_comment.save
    redirect_to("/photos/" + @the_comment.photo_id.to_s)

  end
end
