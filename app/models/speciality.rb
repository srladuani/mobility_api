class Speciality < ActiveRecord::Base
  has_many :conferences, through: :conference_specialities
  has_many :conference_specialities, dependent: :destroy

  has_many :users, through: :user_specialities
  has_many :user_specialities, dependent: :destroy
end
