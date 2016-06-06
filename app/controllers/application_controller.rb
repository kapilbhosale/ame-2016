class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :set_current_user

  def after_sign_in_path_for(resource)
    # set current user for the application
    @current_user = resource

    if @current_user.type == 'Admin'
      admin_root_path
    elsif @current_user.type == 'Student'
      student_root_path
    else
      "/"
    end
  end


end
