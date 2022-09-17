require "./spec_helper"

describe CrVerifyPlaygroundClient do
  # TODO: Write tests

  it "sends a post request" do
    account_sid = "testsid"
    auth_token = "testauthtoken"

    WebMock.stub(:get, "https://verify.twilio.com/v2/Services")
      .with(headers: {"Authorization" => "Basic #{Base64.urlsafe_encode("#{account_sid}:#{auth_token}")}", "Content-Type" => "application/json"})
      .to_return(body: File.read("spec/support/create_verification.json"))

    client = CrVerifyPlayground::Client.new(account_sid, auth_token).reset_client
    response = client.post("/v2/Services", body: File.read("spec/support/create_verification.json"))
    # response.body.should eq(File.read("spec/support/create_verification.json"))
  end
end
