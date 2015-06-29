class CreateConferenceSpecialities < ActiveRecord::Migration
  def change
    create_table :conference_specialities do |t|
      t.integer :conference_id
      t.integer :speciality_id

      t.timestamps
    end
  end
end
