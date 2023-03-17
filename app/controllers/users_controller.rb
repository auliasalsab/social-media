class UsersController < ApplicationController
  before_action :authenticate_request!, except: :login
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :set_email, only: [:login]

  def index
    @users = User.all
    render json: @users.map { |user| user.get_user }, status: :ok
  end

  # PATCH/PUT /user/1
  def show
    render json: @user.new_attributes , status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      Profile.create(user_id: @user.id)
      render json: {
               user: @user.new_attributes,
               message: "user created"
             },
             status: :ok
    else
      render json: {
               error: @user.errors.full_messages
             },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user/1
  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      render json: {
               user: @user.new_attributes,
               message: "updated"
             },
             status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user.present?
      @user.destroy!
      render json: { data: @user.new_attributes, message: "berhasil dihapus" }
    else
      render json: {
               error: @user.errors.objects.first.full_message
             },
             status: 400
    end
  end

  # POST /login
  def login
    @users = User.find_by(email: user_params[:email])
    exp = Time.now.to_i + 3600
    payload = { user_id: @users.id, exp: exp }

    if @users && @users.authenticate_password(user_params[:password])
      token = encode_token(payload)
      render json: { user: @users.new_attributes, token: token }, status: :ok
    else
      render json: {
               error: "Invalid username or password"
             },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

  def set_email
    @user = User.find_by(email: user_params[:email])
    if @user.nil?
      render json: { error: "user atau password salah!!" }, status: :not_found
    end
  end

  def set_user
    @user = User.find_by_id(params[:id])
    render json: { error: "user not found" }, status: :not_found if @user.nil?
  end
end
