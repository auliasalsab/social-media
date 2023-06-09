class PostsController < ApplicationController
  before_action :authenticate_request!, except: :login
  before_action :set_post, only: %i[show update destroy]
  before_action :access_post_request!, only: %i[update destroy]

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts.map { |post| post.new_attributes }
  end

  # GET /posts/1
  def show
    render json: @post.get_post_by_id, status: :ok
  end

  # POST /posts
  def create
    @post =
      Post.new(
        user_id: @current_user.id,
        caption: post_params["caption"],
        post_type: post_params["post_type"]
      )
    if @post.save
      render json: {
               data: @post.new_attributes,
               message: "created"
             },
             status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: {
               post: @post.new_attributes,
               message: "created"
             },
             status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /routes/1
  def destroy
    @post.destroy
    render json: { error: "post success deleted" }, status: :ok if @post
  end

  private

  def access_post_request!
    unless @current_user.id == @post.user_id
      render json: { errors: "Forbidden!!" }, status: :forbidden
    end
  end

  def set_post
    @post = Post.find_by_id(params[:id])
    if @post.nil?
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  def post_params
    params.permit(:caption, :post_type, :user_id)
  end
end
