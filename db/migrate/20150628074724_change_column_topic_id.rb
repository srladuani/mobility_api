class ChangeColumnTopicId < ActiveRecord::Migration
  def change
    add_column    :topics, :conference_id, :integer
    remove_column :conferences, :topic_id 
  end
end
