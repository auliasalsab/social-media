class LikesController < ApplicationController
  before_action :authenticate_request!, except: :login
  before_action :set_like, only: %i[destroy]

  # POST /follows
  def create
    @like = Like.new(like_params)
    if @like.save
      render json: { like: @like, message: "created" }, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /follows/1
  def destroy
    @like.destroy
    render json: { error: "folowing success deleted" }, status: :ok if @like
  end

  private

  def access_post_request!
    unless @current_user.id == @like.user_id
      render json: { errors: "Forbidden!!" }, status: :forbidden
    end
  end

  def set_like
    @like = Like.find_by_id(params[:id])
    if @like.nil?
      render json: { error: "like not found" }, status: :not_found
    end
  end
  # def follow_not_found
  #   @follow = Follow.find_by_id(params[:id])
  #   if @follow.nil?
  #     render json: { error: "Follow not found!!" }, status: :not_found
  #   end
  # end

  def like_params
    params.permit(:user_id, :likeable_type, :likeable_id )
  end
end
