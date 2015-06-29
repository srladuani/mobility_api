class Topic < ActiveRecord::Base
  belongs_to :conference
  has_many   :topic_suggestions
end
