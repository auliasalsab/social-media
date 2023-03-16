class ProfileController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    # GET /profiles
    def index
        @profiles= Post.all
        
        render json: @profiles.map { |profile| profile.new_attributes }
    end

    # GET /profiles/1
    def show
        render json: @profile.new_attributes
    end

    # POST /profiles
    def create
        @profile= User.find_by_id(profile_params[:user_id])
        if @user.nil? 
            return render json: {
                message: "User not found"
            }, status: :bad_request
        end
        @post = Route.new(route_params)


        if @post.save
            render json: @post.new_attributes, status: :created
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /posts/1
    def update
        if @post.update(post_params)
            render json: @post.new_attributes
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /routes/1
    def destroy
        @post.destroy
        if @post
            render json: { error: "post success deleted" }, status: :ok
        end
    end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
        @post = Route.find_by_id(params[:id])
      if @post.nil?
        render json: { error: "post not found" }, status: :not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:route).permit(:caption, :post_type, :user_id)
    end
end
