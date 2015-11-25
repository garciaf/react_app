Pusher.app_id     = Settings.pusher.app_id
Pusher.key        = Settings.pusher.key
Pusher.secret     = Settings.pusher.secret
Pusher.logger     = Rails.logger
Pusher.encrypted  = true
if Rails.env.test?
  module Pusher
    class Client
      def trigger(channels, event_name, data, params = {})
        ''
      end
    end
  end
end
