module CrVerifyPlayground
  class VerificationToken
    def self.send(account_sid : String, auth_token : String, verification_token : String, recipient : String)
      client = CrVerifyPlayground::Client.new(account_sid, auth_token).reset_client
      client.post("/v2/Services/#{verification_token}/Verifications", body: URI::Params.encode({"Channel" => "email", "To" => "#{recipient}"}))
    end
  end
end
