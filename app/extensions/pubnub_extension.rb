require 'pubnub'
require 'singleton'

class PubnubExtension
  include Singleton

  def initialize
    @client = Pubnub.new(
      subscribe_key: ENV['PUBNUB_SUBSCRIBE_KEY'],
      publish_key: ENV['PUBNUB_PUBLISH_KEY'],
      logger: Rails.logger,
      error_callback: lambda do |msg|
        puts "Error callback says: #{msg.inspect}"
      end,
      connect_callback: lambda do |msg|
        puts "CONNECTED: #{msg.inspect}"
      end
    )
  end

  def client
    return @client
  end

end
