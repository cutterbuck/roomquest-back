class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :current_lat, :current_long, :profile_image_url

  has_one :vacancy
  has_many :friends, class_name: "User", through: :user_friends
end
