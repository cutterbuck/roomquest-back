class VacancySerializer < ActiveModel::Serializer
  attributes :id, :address, :apt_num, :city, :state, :zipcode, :description, :lat, :lng

  belongs_to :user
end
