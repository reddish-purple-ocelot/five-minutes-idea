class RoomChannel < ApplicationCable::Channel
  def subscribed
  	current_user.rooms.each do |room|
	    stream_from "room:#{room.id}"
	  end
  end

  def unsubscribed
  	stop_all_streams
  end

  def speak(data)
  	ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end
