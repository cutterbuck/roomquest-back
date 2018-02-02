class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :authorized

  private

  def issue_token(payload)
    JWT.encode(payload, ENV["secret_key"], ENV["jerry_garcia"])
  end

end
