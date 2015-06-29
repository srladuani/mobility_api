class Api::V1::ConferencesController < ApplicationController
  before_filter :authenticate_user
  before_filter :authenticate_moderator

  def create
    @conference = @user.conferences.new(conference_params)
    if @conference.save
      render json:{
        success: true,
        message: "Conference created successfully"
      }
    else
      render json: {success: false, message: @conference.errors.full_messages.first}
    end  
  end
  private
  def conference_params 
    params.require(:conference).permit(:start_date, :end_date, :location, :organizer_id, :conference_status)
  end
end