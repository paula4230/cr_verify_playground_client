module CrVerifyPlayground
  class VerificationService
    def self.create(account_sid : String, auth_token : String, body : String)
      client = CrVerifyPlayground::Client.new(account_sid, auth_token).reset_client
      client.post("/v2/Services", body: body)
    end
  end
end
