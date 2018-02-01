class Vacancy < ApplicationRecord
  belongs_to :room_owner, class_name: "User", foreign_key: 'room_owner_id'
end
