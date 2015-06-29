class Api::V1::InvitationsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authenticate_doctor
  def index
    @invitations = Invitation.where(doctor_id: @user.id)
  end

  def accept_reject_invitation
    @invitation = Invitation.find(params[:id])
    if @invitation.present? 
      @invitation.status = params[:status]
      if @invitation.save
        render json:{
          success: true,
          message: "invitation successfully updated",
          status: @invitation.status 
        }
      else
        render json: {success: false, message: @invitation.errors.full_messages.first}  
      end  
    else
      render json: {success: false, message: "invitation not found!"}
    end 
  end
end
