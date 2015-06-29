class Api::V1::ConferencesController < ApplicationController
  before_filter :authenticate_user
  before_filter :authenticate_moderator, only: [:create]

  def index
    @conferences = Conference.paginate(:page => params[:page], :per_page => 5)

  end

  def create
    byebug
    @topic = Topic.new(topic_params)
    if @topic.save
      @conference = @user.moderator_conferences.new(conference_params)
      if @conference.save
        specialities_ids = params[:specialities][:ids].split(',').map(&:to_i)
        @conference.update_attributes(topic_id: @topic_id)
        specialities_ids.each do |speciality_id|  
          @conference.conference_specialities.create(speciality_id: speciality_id)
        end  
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