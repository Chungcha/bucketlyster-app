class CommentsController < ApplicationController

    before_action :find_comment, only: [:edit, :update, :destroy]

    def new
        @comment = Comment.new
    end

    def create
        @item = Item.find(params[:item_id])
            @comment = @item.comments.create(comment_params)

        redirect_to item_path(@item)
        # https://web-crunch.com/lets-build-with-ruby-on-rails-blog-with-comments/
    end

    def edit
    end   

    def update
        @comment.update(comment_params)

        redirect_to item_path(@item)
    end

    def destroy
        @item = Item.find(params[:item_id])
        @comment = @item.comments.find(params[:id])
        @comment.destroy

        redirect_to item_path(@item)
        # https://web-crunch.com/lets-build-with-ruby-on-rails-blog-with-comments/
    end    

    private
    def comment_params
        params.require(:comment).permit(:content, :audience_id,:item_id)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end
