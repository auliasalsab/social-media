class SearchsController < ApplicationController
  def home
    post = Post.all
    render json: post, status: :ok
  end
end
