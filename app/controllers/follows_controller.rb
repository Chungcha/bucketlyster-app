class FollowsController < ApplicationController


    # create_table "follows", force: :cascade do |t|
    #     t.integer "audience_id"
    #     t.integer "list_id"


    def button
        @follow = Follow.find_by(audience_id: session[:user_id], list_id: params[:id])
        if @follow
            @follow.destroy
            redirect_to list_path(params[:id])
        else
            @follow = Follow.create(audience_id: session[:user_id], list_id: params[:id] )
            redirect_to list_path(params[:id])
        end
    end
    
    private

    def follow_params
        params.require(:follow).permit(:user_id, :list_id)
    end

end
