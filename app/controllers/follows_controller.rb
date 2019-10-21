class FollowsController < ApplicationController

    def new
        @follow = Follow.new
    end

    def create
        @follow = Follow.create(follow_params)
    end

    def destroy
        @list = List.find(params[:id])
        @follow = Follow.find(params[:id])
        @follow.destroy

        redirect_to list_path(@list)
    end 
    
    private

    def follow_params
        params.require(:follow).permit(:user_id, :list_id)
    end

end
