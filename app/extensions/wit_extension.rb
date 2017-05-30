require 'wit'
require 'singleton'

class WitExtension
  include Singleton

  def initializer
    actions = {
      send: -> (request, response) {
        # something when bot responds
      },

      findRestaurants: -> (request) {
        #
      }
    }
    @client = Wit.new(access_token: ENV['WIT_SERVER_TOKEN'], actions: actions)
  end

  def client
    return @client
  end

  def set_conversation(conversation)
    @conversation = conversation
  end

end
