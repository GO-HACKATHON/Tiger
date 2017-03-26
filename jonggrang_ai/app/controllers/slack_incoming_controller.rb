class SlackIncomingController < ApplicationController
    include SlackIncomingControllerHelper
    include SlackService

    def action
        SlackService.send_notification_info(do_action(params))
    end
end
