class CreateVacancies < ActiveRecord::Migration[5.1]
  def change
    create_table :vacancies do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.float :lat
      t.float :long
      t.string :description
      t.string :title
      t.integer :room_owner_id

      t.timestamps
    end
  end
end
