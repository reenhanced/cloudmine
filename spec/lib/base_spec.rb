require "spec_helper"

describe Cloudmine::Base do
  let(:api_key) { "api_key_for_me" }
  let(:app_id)  { "myappid" }

  context "initialization" do
    subject       { Cloudmine::Base.new(api_key, app_id) }

    its(:api_key) { should == api_key }
    its(:app_id)  { should == app_id }
  end

  context "top level accessors" do
    before do
      Cloudmine.api_key = "apikey"
      Cloudmine.app_id  = "app_id"
    end

    subject { Cloudmine }

    its(:api_key) { should == "apikey" }
    its(:app_id)  { should == "app_id" }
  end
end
