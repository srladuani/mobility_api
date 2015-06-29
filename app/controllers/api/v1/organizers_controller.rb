class Api::V1::OrganizersController < ApplicationController
  before_filter :authenticate_user
  before_filter :authenticate_moderator
  def index
    @organizers = Organizer.all
  end
end
