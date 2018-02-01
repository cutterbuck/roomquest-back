class User < ApplicationRecord
  has_many :user_friends
  has_many :friends, class_name: "User", through: :user_friends
  has_one :vacancy


  def associations
    associations = []
    self.friends.map do |friend|
      friend.friends.each do |fof|
        associations << fof
      end
    end
    associations.delete_if{|el| el.name == self.name}.uniq
    associations
  end

  def vacant_rooms
    rooms = self.associations.map{|ass| ass.vacancy}
    rooms
  end
end
