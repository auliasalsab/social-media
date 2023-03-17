class CommentsController < ApplicationController
  before_action :authenticate_request!, except: :login
  # GET /posts
  def index
    @comment= Comment.all
    render json: @comment.map { |comment| comment.get_post_by_id}
  end

  # GET /posts/1
  def show
    render json: @posts.map { |post| post.new_attributes }
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

  def post_params
    params.permit(:caption, :post_type, :user_id)
  end
end
