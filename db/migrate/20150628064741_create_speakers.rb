class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.integer :conference_id
      t.integer :speaker_id

      t.timestamps
    end
  end
end
