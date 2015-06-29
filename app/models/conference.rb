class Conference < ActiveRecord::Base
  has_one  :organizer, dependent: :destroy
  belongs_to :topic, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :specialities, through: :conference_specialities
  has_many :conference_specialities, dependent: :destroy
  belongs_to :moderator, class_name: "User", :foreign_key => 'moderator_id'
  has_many :users, through: :speaker
  has_many :speakers, dependent: :destroy 
  validates :location, :start_date, :end_date, presence: true


  def get_specialities
    specials = []
    self.specialities.each do |speciality|   
      specials.push(
        id:   speciality.id,
        name: speciality.name
      )
    end
    specials
  end   
end
