class UserSpeciality < ActiveRecord::Base
  belongs_to :speciality
  belongs_to :user
end
