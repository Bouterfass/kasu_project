class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :configure_devise_parameters, if: :devise_controller?

    def configure_devise_parameters
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :avatar)}
    end
end
