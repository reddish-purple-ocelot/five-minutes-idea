class RoomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.rooms.each do |room|
	    stream_from "room: #{room.id}"
	  end
  end

  def unsubscribed
  	stop_all_streams
  end

  def speak
    ActionCable.server.broadcast "room_channel", message: data['message']
  end

  def send_message(data)
    @room = Room.find(data['room_id'])
    message = @room.messages.create(content: data['content'], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
