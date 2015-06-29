class CreateUserSpecialities < ActiveRecord::Migration
  def change
    create_table :user_specialities do |t|
      t.integer :user_id
      t.string :speciality_id

      t.timestamps null: false
    end
  end
end
