class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :conference_id
      t.integer :moderator_id
      t.integer :doctor_id
      t.integer :status

      t.timestamps
    end
  end
end
