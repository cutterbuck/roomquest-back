class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    data = params[:response]
    user = User.find_or_create_by(user_params(data))

    encryptedAccess = issue_token({token: data[:accessToken]})

    user.update(access_token: encryptedAccess)
    render json: user_with_token(user)
  end

  def show

    if my_user
      render json: {
        id: my_user.id,
        name: my_user.name
      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   if @user.save
  #     render json: @user
  #   else
  #     render json: {errors: @user.errors.full_messages}, status: 422
  #   end
  # end

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
