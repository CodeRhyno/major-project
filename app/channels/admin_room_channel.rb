class AdminRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'admin_room_channel'
    stream_for params[:latest_ratings]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
