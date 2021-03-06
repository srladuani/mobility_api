class Api::V1::UsersController < ApplicationController
  # before_filter :authenticate_user, except: [:create]
  before_filter :login_params_present?, only: :login
  before_filter :authenticate_user, only: [:index, :destroy]
  before_filter :authenticate_moderator, only: [:index, :destroy]
  def index
    @doctors = User.where(role_id: Role::ROLE[:doctor])
  end

  def create
    @user = User.new(user_params)
    if params[:user][:role].present?
      if @user.save
        if params[:specialities].present? and params[:specialities].any?
          specialities_ids = params[:specialities][:ids].split(',').map(&:to_i)
          specialities_ids.each do |speciality_id|  
            @user.user_specialities.create(speciality_id: speciality_id)
          end
        end  
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

  def destroy
    @doctor = User.find_by_id(params[:id])
    if @doctor.present? 
      if @doctor.destroy
        render json: {
          success: true,
          message: "doctor deleted successfully"          
        }
      else
        render json: { success: false, message: @doctor.errors.full_messages.first } 
      end  
    else
      render json:{success: false, message: "doctor not found!"}
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
    params.require(:user).permit(:full_name, :email, :password, :country, :phone)
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
