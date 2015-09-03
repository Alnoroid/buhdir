class ApplicationController < ActionController::Base
  before_action :require_login
  include TheRole::Controller
  private
  def not_authenticated
    #redirect_to login_path, alert: "Please login first"
    redirect_to login_path
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
