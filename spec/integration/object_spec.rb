require 'spec_helper'

describe Cloudmine::Object do
  let(:app_id)  { "appid" }
  let(:api_key) { "apikey" }

  before do
    Cloudmine.app_id  = app_id
    Cloudmine.api_key = api_key
  end

  describe "#create" do
    let(:request_body)  { { "key1" => "value" }.to_json }
    let(:response_body) { { "success" => { "key1" => "created" } }.to_json }
    let!(:request) {
      WebMock.stub_request(:put, "https://api.cloudmine.me/v1/app/#{app_id}/text").with(headers: { "X-CloudMine-ApiKey" => api_key,
                                                                                                   "Content-Type" => "application/json" },
                                                                                        body:     request_body)
                                                                                  .to_return(body:    response_body,
                                                                                             status:  200,
                                                                                             headers: { "Content-Type" => "application/json" })
    }

    it "issues a create request to Cloudmine" do
      Cloudmine::Object.create("key1", "value")

      request.should have_been_requested
    end
  end
end
