class OpenshiftIncomingController < ApplicationController
    include OpenshiftIncomingControllerHelper
    include SlackService
    
    def alert
        SlackService.send_notification_info(define_alert(params))
    end
end
