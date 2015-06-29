class Api::V1::InvitationsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authenticate_doctor
  def index
    @invitations = Invitation.where(doctor_id: @user.id)
  end
end
