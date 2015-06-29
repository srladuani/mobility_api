class Invitation < ActiveRecord::Base
  belongs_to :conference
  belongs_to :doctor, class_name: "User", :foreign_key => 'doctor_id'
end
