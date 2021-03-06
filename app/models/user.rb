class User < ActiveRecord::Base
  has_many   :topic_suggestions
  has_many   :specialities, through: :user_specialities
  has_many   :user_specialities, dependent: :destroy
  has_many   :invitations, class_name: "Invitation", :foreign_key => 'doctor_id'
  belongs_to :role
  has_many :moderator_conferences, class_name: "Conference", :foreign_key => 'moderator_id'
  has_many :conferences, through: :speaker
  has_many :speakers, dependent: :destroy, foreign_key: :speaker_id 
  validates :full_name, :email, :password, :country, presence: true         
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true}
  validates :email, uniqueness: {case_insensitive: true, allow_blank: true}
  before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end    
  end

  def is_doctor?
    self.role.id.eql? Role::ROLE[:doctor]
  end
  
  protected

  def generate_authentication_token
    loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.where(authentication_token: random_token).first
    end
  end
end