module CrVerifyPlayground
  class Client
    private getter account_sid : String
    private getter auth_token : String

    BASE_URI = "verify.twilio.com"

    def initialize(@account_sid, @auth_token)
    end

    def reset_client
      HTTP::Client.new(BASE_URI, port: 443, tls: true).tap do |client|
        client.before_request do |request|
          request.headers["Authorization"] = "Basic #{Base64.urlsafe_encode("#{account_sid}:#{auth_token}")}"
          request.headers["Content-Type"] = "application/json"
        end
      end
    end

    def post(path : String, body)
      reset_client.post("v2/Services", body)
    end

    def get(path : String)
      reset_client.get("v2/Services")
    end
  end
end
