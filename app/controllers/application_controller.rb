class ApplicationController < ActionController::Base
 # before_action :authenticate_user!
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
 before_filter :update_sanitized_params, if: :devise_controller?


def update_sanitized_params
  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:designation_id,:first_name, :middle_name, :last_name, :user_ID, :password, :password_confirmation, :email, :emloyee_ID, :dob, :gender, :time_zone, :doj, :educational_detail, :comments, :lock, :active, :deactive_date, :deactive_reason, :work_phone)}
  devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:designation_id,:first_name, :middle_name, :last_name, :user_ID,:current_password, :password, :password_confirmation, :email, :emloyee_ID, :dob, :gender, :time_zone, :doj, :educational_detail, :comments, :lock, :active, :deactive_date, :deactive_reason, :work_phone)}
end


  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
