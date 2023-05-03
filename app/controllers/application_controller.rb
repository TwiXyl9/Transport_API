class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        before_action :configure_permitted_parameters, if: :devise_controller?
        rescue_from ActionController::ParameterMissing, with: :handle_errors
        include ActionController::Helpers
        helper_method :is_admin?
        protected
        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
        end

        private
        def handle_errors
                render json: { 'errors': {'full_messages': "Parameter missing #{params.to_unsafe_h.except(:controller, :action, :id, :username, :password).keys}"} }, status: :unprocessable_entity
        end
        def is_admin?
                return head :unauthorized unless current_user
                raise(Errors::LackAccessRights)  unless !current_user.user?
        end
end
