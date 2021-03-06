class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :authenticate!

  def current_user
    # session[:user_id] = nil

    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate!
    unless logged_in?
      redirect_to root_url, notice: "You must be logged in to do that buddy."
    end
  end


end


