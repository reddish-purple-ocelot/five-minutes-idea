class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
  	# binding.pry
  	ActionCable.server.broadcast "rooms #{message.room.id}", {
  		message: message.content,
  	}
  end
end
