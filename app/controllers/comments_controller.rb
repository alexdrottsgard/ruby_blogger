class CommentsController < ApplicationController
    before_action :require_login, except: [:create]
    def create
        # fail to see params and what data is extractable from the params-hash
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
        @comment.save
        # flash.notice = "Comment for '#{@comment.article}' Added!"

        redirect_to article_path(@comment.article)
    end
    def comment_params
        params.require(:comment).permit(:author_name, :body)
      end
end
