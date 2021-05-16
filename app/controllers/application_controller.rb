class ApplicationController < ActionController::Base
   before_action :authenticate_user!
   before_action :configure_permitted_parameters, if: :devise_controller?

   protected

   def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:terms_and_agreements])
      # Register with Devise that name and avatar are extra fields and Devise accepts
      # when submitting the Edit form.
      # Avatar Referenced from: https://gorails.com/episodes/user-avatars-with-rails-active-storage 
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
      
   end
end
