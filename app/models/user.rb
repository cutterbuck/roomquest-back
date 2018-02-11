class User < ApplicationRecord
  has_many :user_friends
  has_many :friends, class_name: "User", through: :user_friends
  has_one :vacancy


  def associations
    associations = []

    self.friends.each do |friend|
      associations << friend
      friend.friends.each do |fof|
        associations << fof
      end
    end
    associations.delete_if{|el| el.name == self.name}.uniq!
    associations
  end

  def associations_with_rooms
    self.associations.select{|ass| ass.vacancy}
  end

  def vacant_rooms
    self.associations.map{|ass| ass.vacancy}
  end
end
