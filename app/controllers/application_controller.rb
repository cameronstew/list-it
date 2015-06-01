class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user
  #
  # def authenticate
  #    if current_user.nil?
  #     # store_location
  #      redirect_to root_path, notice: "You must sign in"
  #    end
  # end
end
