class AdminPanelController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    def index
    end

    def show_users_panel
        @users = User.all
    end

    def generate_new_token
        @user = User.find(params[:id])
        @user.token = SecureRandom.hex
        @user.save

        respond_to do |format|
            format.js
        end
    end

    def show_devices_panel
        redirect_to devices_path
    end
end
