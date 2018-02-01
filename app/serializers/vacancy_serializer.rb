class VacancySerializer < ActiveModel::Serializer
  attributes :id, :title, :address, :city, :state, :zipcode, :description, :lat, :long

  belongs_to :user
end
