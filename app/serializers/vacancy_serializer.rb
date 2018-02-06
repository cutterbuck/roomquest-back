class VacancySerializer < ActiveModel::Serializer
  attributes :id, :address, :apt_num, :city, :state, :zipcode, :description

  belongs_to :user
end
