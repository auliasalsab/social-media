class SearchsController < ApplicationController
  def home
    post = Post.all
    render json: post, status: :ok
  end

  def search
    q = post_params["q"]
    post = search_data ("%#{q}%")
    render json: { searhing_count: post.length, post: post }
  end

  private

  def search_data(q)
    logger.debug "===================="
    # logger.debug book
    post = Post.where("caption iLIKE ?", q)
    return(
      post.map do |pos|
        {
          id: pos.id,
          user: pos.user["name"],
          caption: pos.caption,
          type: pos.post_type,
          updated: pos.updated_at
        }
      end
    )
  end

  def post_params
    params.permit(:q)
  end
end
