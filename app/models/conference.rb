class Conference < ActiveRecord::Base
  belongs_to :organizer
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
  
  def invite_all_doctors
    doctors = User.where(role_id: Role::ROLE[:doctor])
    doctors.each do |doctor|
      if doctor.specialities.present? 
        intersection = doctor.specialities.ids & self.specialities.ids
        if intersection.present? 
          self.invitations.create(moderator_id: self.id, doctor_id: doctor.id)
        end 
      end  
    end  
  end   
end
