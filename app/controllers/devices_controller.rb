class DevicesController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin, only: [:index]
    before_action :is_admin?
    before_action :find_device, only: [:show, :edit, :update, :destroy]

    def index
        @devices = Device.all.includes(:ratings)
        @last_ratings = Device.all.includes(:ratings).map { |device| device.ratings.last }
        @last_ratings = @last_ratings.reject { |element| element.blank? }
    end

    def new
        @device = Device.new
        respond_to do |format|
            format.js
        end
    end

    def create
        @device = Device.new(set_params)
        @device.uuid = SecureRandom.hex
        if @device.save
            respond_to do |format|
                format.js
            end
        end 
    end

    def show
        @device_ratings = Rating.where(device: @device)
        respond_to do |format|
            format.js
        end
    end

    def edit
        respond_to do |format|
            format.js
        end
    end

    def update
        if @device.update(set_params)
            respond_to do |format|
                format.js
            end
        end 
    end

    def destroy
        if @device.destroy
            respond_to do |format|
                format.js
            end
        end
    end

    private

    def set_params
        params.require(:device).permit(:name, :user_id, :power_rating)
    end

    def find_device
        @device = Device.find(params[:id])
    end

    def is_admin?
        @is_admin = current_user_admin?
    end
end
