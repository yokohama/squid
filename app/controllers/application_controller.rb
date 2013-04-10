class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_actor
    if current_admin
      authenticate_admin!
    elsif current_investor
      authenticate_investor!
    else
      authenticate_user!
    end
  end

  def after_sign_in_path_for(resource_name)
    dashboard_path
  end

  def after_sign_out_path_for(resource_name)
    case resource_name
    when :admin
      new_admin_session_path
    when :investor
      new_investor_session_path
    when :user
      new_user_session_path
    else
      root_path
    end
  end

end
