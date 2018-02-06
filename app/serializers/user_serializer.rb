class UserSerializer < ActiveModel::Serializer
  attributes :user_id, :name, :email, :phone, :profile_image_url, :vacant_rooms

  has_one :vacancy
  has_many :friends, class_name: "User", through: :user_friends


  def user_id
    object.id.to_s
  end
end
