class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :profile_image_url, :vacant_rooms

  has_one :vacancy
  has_many :friends, class_name: "User", through: :user_friends
end
