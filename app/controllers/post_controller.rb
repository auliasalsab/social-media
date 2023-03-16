class PostController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    # GET /posts
    def index
        @posts= Post.all
        
        render json: @posts.map { |post| post.new_attributes }
    end

    # GET /posts/1
    def show
        render json: @post.new_attributes
    end

    # POST /posts
    def create
        @post= Post.find_by_id(post_params[:user_id])
        if @post.nil? 
            return render json: {
                message: "User not found"
            }, status: :bad_request
        end
        @post = Post.new(Post_params)


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
        @post = Post.find_by_id(params[:id])
      if @post.nil?
        render json: { error: "post not found" }, status: :not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:caption, :post_type, :user_id)
    end
end
