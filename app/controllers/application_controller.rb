class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :authorized

  private

  def issue_token(payload)
    JWT.encode(payload, ENV["secret_key"], ENV["jerry_garcia"])
  end

  def decode(jwt_token)
    algo = { algorithm: ENV["jerry_garcia"]}
    JWT.decode(jwt_token, ENV["secret_key"], true, algo)[0]
  end

  # def my_user_id
  #   authenticate_or_request_with_http_token do | jwt_token, options|
  #     decoded_token = decode(jwt_token)
  #     my_user_id = decoded_token[0]["user_id"]
  #   end
  # end

  def my_user
    authenticate_or_request_with_http_token do |jwt_token, options|
      begin
        decoded_token = decode(jwt_token)
      rescue JWT::DecodeError
        [{}]
      end
      if decoded_token["user_id"]
        @my_user ||= User.find(decoded_token["user_id"])
      end
    end
  end

end
