class FollowsController < ApplicationController
  before_action :authenticate_request!, except: :login
  before_action :set_follow, only: %i[create]
  before_action :follow_not_found, only: %i[destroy]

  # POST /follows
  def create
    @follow = Follow.new(follow_params)
    if @follow.save
      render json: { follow: @follow, message: "folowing" }, status: :created
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /follows/1
  def destroy
    @follow.destroy
    render json: { error: "folowing success deleted" }, status: :ok if @follow
  end

  private

  def set_follow
    @follow =
      Follow.where(
        follower_id: follow_params['follower_id'],
        following_id: follow_params['following_id']
      )
    if @follow.count >= 1
      render json: { error: "Follow exist" }, status: :ok 
    end
  end

  def follow_not_found
    @follow = Follow.find_by_id(params[:id])
    if @follow.nil?
      render json: { error: "Follow not found!!" }, status: :not_found
    end
  end

  def follow_params
    params.permit(:follower_id, :following_id)
  end
end
