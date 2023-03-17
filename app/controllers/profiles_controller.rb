class ProfilesController < ApplicationController
    before_action :authenticate_request!, except: :login
    before_action :set_profile, only: [:show, :update, :destroy]

    # GET /profiles
    # def index
    #     @profiles= Profile.all
        
    #     render json: @profiles.map { |profile| profile.new_attributes}
    # end

    # GET /profiles/1
    def show
        render json: @profile.new_attributes
    end

    # # POST /profiles
    # def create
    #     @user= User.find_by_id(profile_params[:user_id])
    #     if @user.nil? 
    #         return render json: {
    #             message: "User not found"
    #         }, status: :bad_request
    #     end
    #     @profile = Profile.new(profile_params)

    #     if @profile.save
    #         render json: @profile.new_attributes, status: :created
    #     else
    #         render json: @profile.errors, status: :unprocessable_entity
    #     end
    # end

    # PATCH/PUT /profile/1
    def update
        if @profile.update(profile_params)
            render json: @profile.new_attributes
        else
            render json: @profile.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /profiles/1
    def destroy
        @profile.destroy
        if @profile
            render json: { error: "profile success deleted" }, status: :ok
        end
    end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
        @profile = Profile.find_by_id(params[:id])
      if @profile.nil?
        render json: { error: "profile not found" }, status: :not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:user_id, :phone_number, :dob, :bio, :gender)
    end
end
