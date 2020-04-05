class ApplicationController < ActionController::Base
    def current_user_admin?
        return current_user.roles.select { |role| role.name == 'admin' }.present?
    end

    def authenticate_admin
        if user_signed_in?
            if !current_user_admin?
                redirect_to user_panel_index_path
            end
        end
    end
end
