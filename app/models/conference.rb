class Conference < ActiveRecord::Base
  has_one  :organizer, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :specialities, through: :conference_specialities
  has_many :conference_specialities, dependent: :destroy
  belongs_to :moderator, class_name: "User", :foreign_key => 'moderator_id'
end
