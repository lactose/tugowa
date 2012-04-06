require 'rubygems'
require 'eventmachine'
require 'em-websocket'
require 'pg'

module InstanceServer
  def post_init
    puts "-- someone connected --"
  end

  def receive_data data
    send_data ">>>you sent: #{data}"
    close_connection if data =~ /quit/i
  end

  def unbind
    puts "-- someone disconnected --"
  end

end

EventMachine::run {
  EventMachine::start_server "127.0.0.1", 8081, InstanceServer
}
