class CreateVacancies < ActiveRecord::Migration[5.1]
  def change
    create_table :vacancies do |t|
      t.string :address
      t.string :apt_num
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :description
      t.float :lat
      t.float :long
      t.belongs_to :user

      t.timestamps
    end
  end
end
