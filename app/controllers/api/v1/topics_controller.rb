class Api::V1::TopicsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authenticate_doctor

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      @topic.topic_suggestions.create(user_id: @user.id)
      render json:{
        success: true,
        message: "Suggestions successfully sent",
        topic_id: @topic.id,
        title: @topic.title,
        description: @topic.description
      }
    else
      render json: { success: false, message: @topic.errors.full_messages.first }
    end  
  end

  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
