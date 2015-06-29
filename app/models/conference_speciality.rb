class ConferenceSpeciality < ActiveRecord::Base
  belongs_to :conference
  belongs_to :speciality
end
