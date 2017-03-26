module OpenshiftService
    CREATE_TEMPLATE_URL= "#{ENV['OPENSHIFT_URL']}/oapi/v1/namespaces/jonggrangai/processedtemplates"
    LIST_TEMPLATE_URL= "#{ENV['OPENSHIFT_URL']}/oapi/v1/namespaces/jonggrangai/templates"
    DELETE_TEMPLATE_URL= "#{ENV['OPENSHIFT_URL']}/oapi/v1/namespaces/jonggrangai/templates"
    CREATE_CLUSTER_URL= "#{ENV['OPENSHIFT_URL']}/oapi/v1/appliedclusterresourcequotas"
    LIST_CLUSTER_URL= "#{ENV['OPENSHIFT_URL']}/oapi/v1/clusternetworks"
    DELETE_CLUSTER_URL= "#{ENV['OPENSHIFT_URL']}/oapi/v1/clusternetworks"

    # Example request openshift api format
    # /oapi/v1/namespaces/jonggrangai/buildconfigs
    # {
    #   "metadata": {
    #     "name": "nodejs-test-api"
    #   },
    #   "spec": {
    #     "source": {
    #       "type": "git",
    #       "git": {
    #         "uri": "https://github.com/gsukanto/nodejs_healthcheck.git"
    #       }
    #     },
    #     "strategy": {
    #       "type": "Docker"
    #     }
    #   }
    # }

    class Template
        def self.create(config)
            post_json(CREATE_TEMPLATE_URL, config)
        end

        def self.list(config)
            post_json(LIST_TEMPLATE_URL, config)
        end

        def self.delete(config)
            post_json(DELETE_TEMPLATE_URL, config)
        end
    end

    class Cluster
        def self.create(config)
            post_json(CREATE_CLUSTER_URL, config)
        end

        def self.list(config)
            post_json(LIST_CLUSTER_URL, config)
        end

        def self.delete(config)
            post_json(DELETE_CLUSTER_URL, config)
        end
    end

    private
    def post_json(url, payload)
        curl = Curl::Easy.new(url)
        curl.timeout = ENV['CURL_TIMEOUT'].to_i
        curl.ssl_verify_peer = false
        curl.headers = JSON_POST_HEADERS

        curl.http_post(payload)

        return JSON(curl.body) || nil
      end

end