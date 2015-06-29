class Api::V1::UsersController < ApplicationController
  # before_filter :authenticate_user, except: [:create]
  before_filter :login_params_present?, only: :login
  def create
    @user = User.new(user_params)
    if params[:user][:role].present?
      if @user.save
        @user.update_attribute(:role_id, params[:user][:role])
        render json:{
          success: true,
          message: "Registered successfully",
          authentication_token: @user.authentication_token
        }
      else
        render json: { success: false, message: @user.errors.full_messages.first } 
      end
    else
      render json: { success: false, message: "Role can't be blank" } 
    end  
  end

  def login
    user = User.find_by_email(login_params[:email])
    if user.present?
      if user.password.eql? login_params[:password]
        render json: {
          success: true,
          message: "successfully logged in",
          authentication_token: user.authentication_token,
          role: user.role.id
        }
      else
        invalid_login("inavlid password")
      end 
    else
      invalid_login("invalid email")
    end
  end

  private 
  
  def user_params
    params.require(:user).permit(:full_name, :email, :password, :country)
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def login_params_present?
    if login_params[:email].present?
      if login_params[:password].present?
        return true
      else
        return invalid_login("Password can't be blank")
      end 
    else
      return invalid_login("email can't be blank")
    end  
  end

  def invalid_login(message)
    render json:{
      success: false,
      message: message
    }
  end

end
