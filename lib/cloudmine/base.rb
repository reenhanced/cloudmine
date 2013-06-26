module Cloudmine
  class << self
    def app_id
      Base.app_id
    end

    def app_id=(app_id)
      Base.app_id = app_id
    end

    def api_key
      Base.api_key
    end
    
    def api_key=(api_key)
      Base.api_key = api_key
    end
  end

  class Base
    include HTTParty
    default_timeout 30

    attr_accessor :api_key, :app_id

    def initialize(api_key, app_id)
      self.api_key = api_key
      self.app_id  = app_id
    end

    class << self
      attr_accessor :api_key, :app_id

      def method_missing(sym, *args, &block)
        new(Cloudmine.api_key, Cloudmine.app_id).send(sym, *args, &block)
      end
    end
    
    protected
      def api_call(method, endpoint, options={})
        options[:headers] ||= {}
        options[:headers]["X-CloudMine-ApiKey"] = api_key
        options[:headers]["Content-Type"]       = "application/json"

        options[:body] = options[:body].to_json if options[:body]

        response = self.class.send(method, api_url(endpoint), options)
        begin
          response_body = JSON.parse(response.body)
        rescue JSON::ParserError
          response_body = response.body
        end

        unless (200..299).include? response.code
          raise "Error from Cloudmine API: #{response_body["errors"].join(", ")} (code #{response.code})"
        end

        response_body
      end
      
      def api_url(endpoint)
        "https://api.cloudmine.me/v1/app/#{app_id}/#{endpoint}"
      end
  end
end
