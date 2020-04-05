class AdminPanelController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    def index
    end

    def show_users_panel
    end

    def show_devices_panel
        redirect_to devices_path
    end
end
