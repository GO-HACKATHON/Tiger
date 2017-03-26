module OpenshiftIncomingControllerHelper
    include NexmoService

    def define_alert(params)
        # TODO: Machine learning 
        pager_duty_type = $redis.hgetall(PAGER_DUTY_TYPE)
        to = $redis.hgetall(ALERT_NOTIFICATION,)
        return first_pager_duty(to['first'], params['error']) if params['type'] = first_pager_duty
        return next_pager_duty(to['next'], get_url_message(params['error']))
    end

    private
    def first_pager_duty(to, message)
        NexmoService.send_sms(to,message)
    end

    def next_pager_duty(to, message, url_message)
        NexmoService.send_sms(to, message)
        NexmoService.do_call(to, url_message)
    end

    def get_url_message(error)
        return $redis.get(error)
    end
end
