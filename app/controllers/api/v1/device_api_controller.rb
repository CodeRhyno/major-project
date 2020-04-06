class Api::V1::DeviceApiController < ApplicationController
  before_action :find_user

  def create
    all_devices = @current_user.devices
    devices_inactive = @current_user.devices.where.not(uuid: params[:uuid])
    ratings_to_create = []
    
    all_devices.each do |device|
      device_inactive = devices_inactive.select { |device| device.uuid == device.uuid }.blank?
      power_rating = device_inactive? 0 : device.power_rating
      
      rating = {
        device_id: device.id,
        power_consumption: power_rating,
        is_online: device_inactive
      }

      ratings_to_create.push(rating)
    end

    ActiveRecord::Base.transaction do
      if Rating.create! ratings_to_create
        ActionCable.server.broadcast 'admin_room_channel', latest_ratings: Device.all.includes(:ratings).map { |device| device.ratings.last }
      end
    end
  end

  private

  def set_params
    params.require(:rating).permit()
  end

  def find_user
    @current_user = User.find_by_token(params[:user_token])
  end
end
