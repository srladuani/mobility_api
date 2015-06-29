class Speaker < ActiveRecord::Base
  belongs_to :user, foreign_key: :speaker_id 
  belongs_to :conference
end
