class FollowsController < ApplicationController
  before_action :authenticate_request!, except: :login

    # POST /follows
    def create
        @follow = Follow.new(follow_params)
        if @follow.save
            render json: @follow, status: :created
        else
            render json: @follow.errors, status: :unprocessable_entity
        end
    end

    # DELETE /follows/1
    def destroy
        @follow.destroy
        if @follow
            render json: { error: "follow success deleted" }, status: :ok
        end
    end
  
    # Only allow a trusted parameter "white list" through.
    def follow_params
      params.permit(:follower_id, :following_id)
    end
end
