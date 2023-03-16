class FollowsController < ApplicationController
  before_action :authenticate_request!, except: :login
  before_action :set_follow, only: [:show, :update, :destroy]

    # GET /follows
    def index
        @follows= Follow.all
        
        render json: @follows.map { |follow| follow.new_attributes}
    end

    # GET /follows/1
    def show
        render json: @follow.new_attributes
    end

    # POST /follows
    def create
        @user= User.find_by_id(follow_params[:user_id])
        if @user.nil? 
            return render json: {
                message: "User not found"
            }, status: :bad_request
        end
        @follow = follow.new(follow_params)

        if @follow.save
            render json: @follow.new_attributes, status: :created
        else
            render json: @follow.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /follow/1
    def update
        if @follow.update(follow_params)
            render json: @follow.new_attributes
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
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
        @follow = follow.find_by_id(params[:id])
      if @follow.nil?
        render json: { error: "follow not found" }, status: :not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    def follow_params
      params.require(:follow).permit(:follower_id, :following_id)
    end
end
