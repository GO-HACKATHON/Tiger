module SlackIncomingControllerHelper
    include OpenshiftService

    def do_action(params)
        splitted_params = params.split(' ')
        case splitted_params.second
        when 'create'
            return create(splitted_params.third, splitted_params)
        when 'list'
            return list(splitted_params.third, splitted_params)
        when 'delete'
            return delete(splitted_params.third, splitted_params)
        else
            return $redis.smembers(JONGGRANG_HELP).join("\n")
        end
    end

    private
    def create(action, params)
        case action.downcase
        when 'template'
            return Template.create(params[3..-1].join(' '))
        when 'cluster'
            return Cluster.create(params[3..-1].join(' '))
        end
    end

    def list
        case action.downcase
        when 'template'
            return Template.list((params[3..-1].join(' ')))
        when 'cluster'
            return Cluster.list(params[3..-1].join(' '))
        end
    end

    def delete
        case action.downcase
        when 'template'
            return Template.delete(params[3..-1].join(' '))
        when 'cluster'
            return Cluster.delete(params[3..-1].join(' '))
        end
    end
end
