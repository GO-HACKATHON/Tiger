module NexmoService
    def send_sms(to, message)
        return nexmo_client.send_message(from: 'Ruby', to: to, text: message)
    end

    def do_call(to, answer_url)
        return nexmo_client.create_call({
          to: [{type: 'phone', number: to}],
          from: {type: 'phone', number: ENV['PHONE_FROM']},
          answer_url: [answer_url]
        })
    end

    private
    def nexmo_client
        return Nexmo::Client.new(key: ENV['NEXMO_API_KEY'], secret: ENV['NEXMO_API_SECRET'])
    end

end