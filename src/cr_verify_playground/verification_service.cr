module CrVerifyPlayground
  class VerificationService
    def self.create(account_sid : String, auth_token : String, verification_servive_name : String)
      client = CrVerifyPlayground::Client.new(account_sid, auth_token).reset_client
      client.post("/v2/Services", body: URI::Params.encode({"FriendlyName" => verification_servive_name}))
    end
  end
end
