class AddColomunModeratorIdToConference < ActiveRecord::Migration
  def change
    add_column  :conferences, :moderator_id, :integer
  end
end
