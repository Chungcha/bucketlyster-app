class CommentsController < ApplicationController

    # before_action :find_comment, only: [:edit, :update, :destroy]

    # def new
    #     @item = Item.find(params[:item_id])
    #         @comment = @item.comments.new
    # end

    def create
        @item = Item.find(params[:item_id])
        @comment = @item.comments.create(comment_params)
   
        redirect_to item_path(@item)
        # https://web-crunch.com/lets-build-with-ruby-on-rails-blog-with-comments/
    end

    # def show
    #     no show because the show pages are nested inside the post shows.  can render them in with comment form partials
    # end

    def edit
        @comment = Comment.find(params[:id])
    end   

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)

        redirect_to item_path(@item)
    end

    def destroy
        @comment = Comment.find(params[:id])
        @item = Item.find(params[:item_id])
            @comment = @item.comments.find(params[:id])
            @comment.destroy

        redirect_to item_path(@item)
        # https://web-crunch.com/lets-build-with-ruby-on-rails-blog-with-comments/
    end    

    private
    def comment_params
        params.require(:comment).permit(:content, :audience_id, :item_id)
    end

end
