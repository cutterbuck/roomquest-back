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

  def destroy
    vacancy = Vacancy.find(params[:id])
    vacancy.destroy
  end

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
