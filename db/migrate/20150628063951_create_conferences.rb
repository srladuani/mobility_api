class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.integer :topic_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.integer :organizer_id
      t.integer :conference_status

      t.timestamps
    end
  end
end
