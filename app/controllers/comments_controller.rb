class CommentsController < ApplicationController

    before_action :find_comment, only: [:edit, :update, :destroy]

    def new
        @comment = Comment.new
    end

    def create
        @item = Item.find(params[:item_id])
            @comment = @item.comments.create(comment_params)

        redirect_to item_path(@item)
    end

    def edit
    end   

    def update
        @comment.update(comment_params)

        redirect_to item_path(@item)
    end

    def destroy
        @comment.destroy

        #redirect_to
    end    

    private
    def comment_params
        params.require(:comment).permit(:content, :audience_id,:item_id)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end
