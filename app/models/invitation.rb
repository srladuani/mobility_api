class Invitation < ActiveRecord::Base
  belongs_to :conferece
  belongs_to :user
end
