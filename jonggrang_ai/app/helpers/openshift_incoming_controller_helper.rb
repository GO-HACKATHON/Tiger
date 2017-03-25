module OpenshiftIncomingControllerHelper
    include NexmoService

    def define_alert(params)
    end

    private
    def first_pager_duty(to, message)
        NexmoService.send_sms(to,message)
    end

    def next_pager_duty(to, message, url_message)
        NexmoService.send_sms(to, message)
        NexmoService.do_call(to, url_message)
    end
end
