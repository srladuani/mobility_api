class ChangeColumnConferenceId < ActiveRecord::Migration
  def change
    remove_column :topics, :conference_id
    add_column    :conferences, :topic_id, :integer 
  end
end
