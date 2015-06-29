class Topic < ActiveRecord::Base
  has_one    :conference
  has_many   :topic_suggestions

  validates :title, :description, presence: true 
end
