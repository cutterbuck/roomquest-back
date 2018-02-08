class Api::V1::VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.all
    render json: @vacancies
  end

  def create
    data = params[:data]
    vacancy = Vacancy.create(vacancy_params(data))
    render json: vacancy
  end
  #
  # def update
  #   @vacancy = Vacancy.find(params[:id])
  #   @vacancy.update(vacancy_params)
  #   if @vacancy.save
  #     render json: @vacancy
  #   else
  #     render json: {errors: @vacancy.errors.full_messages}, status: 422
  #   end
  # end


  private
  def vacancy_params(data)
    user = User.find_by(email: data[:email])
    params = {
      address: data[:address],
      apt_num: data[:aptNum],
      city: data[:city],
      state: data[:state],
      zipcode: data[:zipcode],
      description: data[:description],
      lat: data[:lat],
      lng: data[:lng],
      user_id: user.id
    }
  end
end
