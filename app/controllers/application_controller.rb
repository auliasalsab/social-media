class ApplicationController < ActionController::API
  @access_token_secret = "secret"
  @refres_token_secret = "secret1"
  def encode_token(payload)
    JWT.encode payload, ENV['SECRET_KEY'], "HS256"
  end

  # def decode_token(payload)
  #   JWT.decode payload, ENV['SECRET_KEY'], true, { algorithm: "HS256" }
  # end

  attr_reader :current_user

  protected

  def authenticate_request!
    # logger.debug auth_token[0]['user_id']
    unless user_id_in_token?
      render json: { errors: ["Not Authenticated"] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[0]["user_id"])
  rescue JWT::VerificationError, JWT::DecodeError#
    render json: { errors: ["Forbidden"] }, status: :forbidden 
  end

  private

  def http_token
    @http_token ||=
      if request.headers["Authorization"].present?
        request.headers["Authorization"].split(" ").last
      end
  end

  def auth_token
    @auth_token ||=
      JWT.decode(http_token, ENV['SECRET_KEY'], true, { algorithm: "HS256" })
  end

  def user_id_in_token?
    http_token && auth_token
  end
end
