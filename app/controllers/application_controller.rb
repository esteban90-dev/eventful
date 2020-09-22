class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def current_user_id
    session[:current_user_id]
  end

  def logged_in?
    return true if current_user
    false
  end

  def require_login
    unless logged_in?
      flash[:notice] = "You must be logged in to perform this action"
      redirect_to new_session_path
    end
  end

  helper_method :current_user
end
