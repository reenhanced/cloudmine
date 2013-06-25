module Cloudmine
  class Object < Base
    def fetch(keys, options = {})
    end

    def update(key, value, options = {})
    end

    def create(key, value)
      api_call(:put, api_url('text'), { key => value })
    end

    def destroy(*keys)
      api_call(:delete, "#{api_url('text')}?keys=#{keys.flatten.join(',')}")
    end
  end
end
