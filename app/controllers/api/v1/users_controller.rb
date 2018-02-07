class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    data = params[:response]
    user = User.find_or_create_by(user_params(data))
    if user
      render json: user_with_token(user)
    else
      render json: {error: 'User not found'}, status: 404
    end
  end


  def show
    if current_user
      render json: {
        id: current_user.id,
        name: current_user.name,
        vacancy: current_user.vacancy,
        email: current_user.email
      }
    else
      render json: {error: 'Hey Snake, you frigged it all up!'}, status: 404
    end
  end


  private
  def user_with_token(user)
    payload = {user_id: user.id}
    jwt = issue_token(payload)
    serialized_user = UserSerializer.new(user).attributes
    {currentUser: serialized_user, code: jwt}
  end

  def user_params(data)
    params = {
      id: data[:id],
      name: data[:name],
      email: data[:email],
      profile_image_url: data[:picture][:data][:url]
    }
  end
end
