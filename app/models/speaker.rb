class Speaker < ActiveRecord::Base
  belongs_to :user, :class => 'User', foreign_id: :speaker_id 
  belongs_to :conference
end
