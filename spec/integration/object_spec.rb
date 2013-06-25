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

  describe "#destroy" do
    let(:response_body) { { "success" => { "key1" => "deleted", "key2" => "deleted" } }.to_json }
    let!(:request) {
      WebMock.stub_request(:delete, "https://api.cloudmine.me/v1/app/#{app_id}/text?keys=key1,key2").with(headers: { "X-CloudMine-ApiKey" => api_key,
                                                                                                   "Content-Type" => "application/json" })
                                                                                  .to_return(body:    response_body,
                                                                                             status:  200,
                                                                                             headers: { "Content-Type" => "application/json" })
    }

    it "issues a delete request to Cloudmine" do
      Cloudmine::Object.destroy(["key1", "key2"])

      request.should have_been_requested
    end
  end

  describe "#fetch" do
    let(:response_body) { { "success" => { "key1" => "value", "key2" => "value" } }.to_json }
    let!(:request) {
      WebMock.stub_request(:get, "https://api.cloudmine.me/v1/app/#{app_id}/text?keys=key1,key2").with(headers: { "X-CloudMine-ApiKey" => api_key,
                                                                                                   "Content-Type" => "application/json" })
                                                                                  .to_return(body:    response_body,
                                                                                             status:  200,
                                                                                             headers: { "Content-Type" => "application/json" })
    }

    it "issues a fetch request to Cloudmine" do
      Cloudmine::Object.fetch(["key1", "key2"])

      request.should have_been_requested
    end

    it "returns a JSON representation of the data stored in cloudmine" do
      fetched = Cloudmine::Object.fetch(["key1", "key2"])

      fetched.should == { "key1" => "value", "key2" => "value" }
    end
  end

  describe "#update" do
    let(:request_body)  { { "key1" => "value" }.to_json }
    let(:response_body) { { "success" => { "key1" => "updated" } }.to_json }
    let!(:request) {
      WebMock.stub_request(:post, "https://api.cloudmine.me/v1/app/#{app_id}/text").with(headers: { "X-CloudMine-ApiKey" => api_key,
                                                                                                   "Content-Type" => "application/json" },
                                                                                        body:     request_body)
                                                                                  .to_return(body:    response_body,
                                                                                             status:  200,
                                                                                             headers: { "Content-Type" => "application/json" })
    }

    it "issues a request to Cloudmine" do
      Cloudmine::Object.update("key1", "value")

      request.should have_been_requested
    end
  end
end
