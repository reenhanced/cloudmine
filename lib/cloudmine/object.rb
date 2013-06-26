module Cloudmine
  class Object < Base
    def fetch(*keys)
      api_call(:get, "#{api_url('text')}?keys=#{keys.flatten.join(',')}")["success"]
    end

    def update(key, value, options = {})
      api_call(:post, api_url('text'), { key => value })
    end

    def create(key, value)
      api_call(:put, api_url('text'), { key => value })
    end

    def destroy(*keys)
      api_call(:delete, "#{api_url('data')}?keys=#{keys.flatten.join(',')}")
    end
  end
end
