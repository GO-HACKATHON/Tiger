module SlackService
     def self.send_notification_info(info_message, channel=ENV['SLACK_DEFAULT_CHANNEL'])
        require 'slack-notifier'

        notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']

        notifier.post(
            text: info_message, 
            channel: channel
        )
    end
end