class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #the methods must be declared as helper methods in order to be available in the views
  helper_method :current_user, :logged_in?, :admin_user?

  def current_user
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  def admin_user?
   !!current_user && @current_user.admin?
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if not logged_in?
      flash[:danger] = "You need to be logged in see this page"
      redirect_to root_path
    end
  end

end
