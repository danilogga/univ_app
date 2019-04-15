class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  before_action :require_user

  def current_user
    # o ||= faz com que só consulte o banco se o current_user não existe
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !!current_user # retorna boolean se o current_user existe ou não
  end

  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
