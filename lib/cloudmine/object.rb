module Cloudmine
  class Object < Base
    def fetch(keys, options = {})
    end

    def update(key, value, options = {})
    end

    def create(key, value)
      api_call(:put, api_url('text'), { key => value })
    end

    def destroy(keys, options = {})
    end
  end
end
