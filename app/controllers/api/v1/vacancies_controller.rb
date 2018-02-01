class Api::V1::VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.all
    render json: @vacancies
  end

  def create
    vacancy = Vacancy.create(vacancy_params)
    render json: vacancy
  end

  def update
    @vacancy = Vacancy.find(params[:id])
    @vacancy.update(vacancy_params)
    if @vacancy.save
      render json: @vacancy
    else
      render json: {errors: @vacancy.errors.full_messages}, status: 422
    end
  end


  private
  def vacancy_params
    params.permit(:name)
  end
end
