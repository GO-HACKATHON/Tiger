module OpenshiftService
    # Example request openshift api format
    # /oapi/v1/namespaces/default/buildconfigs
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
        def self.create
        end

        def self.list
        end

        def self.delete
        end
    end

    class Cluster
        def self.create
        end

        def self.list
        end

        def self.delete
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