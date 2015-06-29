class Topic < ActiveRecord::Base
  has_one   :conference
  has_one   :topic_suggestion, dependent: :destroy

  validates :title, :description, presence: true 
end
