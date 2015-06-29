class Api::V1::ConferencesController < ApplicationController
  before_filter :authenticate_user
  before_filter :authenticate_moderator, only: [:create, :invite_doctor]
  def index
    @conferences = Conference.where('start_date >= ?', Date.today).paginate(:per_page => 5, :page => params[:page])

  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      @conference = @user.moderator_conferences.new(conference_params)
      if @conference.save
        @conference.update_attribute(:topic_id, @topic.id)
        specialities_ids = params[:specialities][:ids].split(',').map(&:to_i)
        specialities_ids.each do |speciality_id|  
          @conference.conference_specialities.create(speciality_id: speciality_id)
        end
        @conference.invite_all_doctors  
        render json:{
          success: true,
          message: "Conference created successfully",
          conference_id: @conference.id,
          topic_id: @topic.id,
          title: @topic.title,
          description: @topic.description,
          specialities: @conference.get_specialities
        }
      else
        render json: {success: false, message: @conference.errors.full_messages.first}
      end
    else
      render json: {success: false, message: @topic.errors.full_messages.first}
    end    
  end
  
  def invite_doctor
    @doctor_invitation = Invitation.new(
      conference_id: params[:id], 
      moderator_id: @user.id,
      doctor_id: params[:doctor_id]
      )
    if @doctor_invitation.save
      render json:{
        success: true,
        message: "invitation successfully updated",
        status: @doctor_invitation.status 
      }
    else
      render json: {success: false, message: @doctor_invitation.errors.full_messages.first}
    end  
  end

  private
  
  def specialities_params
    params.require(:specialities).permit(:name)
  end

  def topic_params
    params.require(:conference).permit(:title, :description)    
  end

  def conference_params 
    params.require(:conference).permit(:start_date, :end_date, :location, :organizer_id, :conference_status)
  end
end