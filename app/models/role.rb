class Role < ActiveRecord::Base
  has_many :users
  ROLE = {doctor: 1, moderator: 2}
end
