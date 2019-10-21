class FollowsController < ApplicationController

    def new
        @follow = Follow.new(follow_params)
    end

    def create
        @follow = Follow.create(follow_params)

    end

    private
    
    def follow_params
        params.require(:follow).permit(:audience_id, :list_id)
    end

end
