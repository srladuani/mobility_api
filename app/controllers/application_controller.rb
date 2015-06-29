class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def authenticate_user
    @user = User.find_by_authentication_token(params[:authentication_token])
    if @user.present?
      @user
    else
      return render json:{
        success: false,
        message: "invalid user!"
      }
    end  
  end

  def authenticate_moderator
    if @user.role.id.eql? Role::ROLE[:moderator]
      @user
    else
      return render json:{
        success: false,
        message: "You are not authorized"
      }
    end  
  end

end
