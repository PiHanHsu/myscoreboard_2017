class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session


  protected

    def configure_permitted_parameters

      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :userid, :gender])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :userid, :gender])
      #devise_parameter_sanitizer.for(:sign_up) << :username
      #devise_parameter_sanitizer.for(:sign_up) << :userid
      #devise_parameter_sanitizer.for(:sign_up) << :gender

      #devise_parameter_sanitizer.for(:account_update) << :username
      #devise_parameter_sanitizer.for(:account_update) << :userid
      #devise_parameter_sanitizer.for(:account_update) << :gender


    end

end

