class User < ApplicationRecord
  has_many :user_friends
  has_many :friends, class_name: "User", through: :user_friends
end
