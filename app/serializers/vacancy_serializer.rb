class VacancySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :address, :apt_num, :city, :state, :zipcode, :description, :lat, :lng

  belongs_to :user

  def user_id
    object.user.id
  end
end
