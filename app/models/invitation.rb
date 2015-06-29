class Invitation < ActiveRecord::Base
  belongs_to :conferece
  belongs_to :doctor, class_name: "User", :foreign_key => 'doctor_id'
end
