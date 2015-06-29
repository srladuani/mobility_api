class CreateTopicSuggestions < ActiveRecord::Migration
  def change
    create_table :topic_suggestions do |t|
      t.integer :topic_id
      t.integer :user_id

      t.timestamps
    end
  end
end
