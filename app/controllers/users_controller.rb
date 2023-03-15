class UsersController < ApplicationController
  before_action :authenticate_request!, except: :login
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    # @users = User.all
    @users = Book.all
    render json: @users
    # render json: @users.map { |user| user.new_attributes }
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: @user }, status: :ok
    else
      render json: {
               error: @user.errors.full_messages
             },
             status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])
    exp = Time.now.to_i + 20
    payload = { user_id: @user.id, exp: exp }
    # refres_token = { user_id: @user.id, exp: exp + 24 * 3600 }

    if @user && @user.authenticate_password(user_params[:password])
      token = encode_token(payload)
      # refres_token = encode_token(refres_token)
      # @user.update(refres_token: refres_token)
      render json: {
               user: @user,
               token: token
             },
             status: :ok
    else
      render json: {
               error: "Invalid username or password"
             },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password )
  end

  def not_found
    render json: { message: "User not found" }, status: 404
  end
end
