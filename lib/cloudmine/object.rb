module Cloudmine
  class Object < Base
    def fetch(*keys)
      api_call(:get, 'text', nil, :query => { :keys => keys.flatten.join(',') })["success"]
    end

    def update(key, value, options = {})
      api_call(:post, 'text', { key => value })
    end

    def create(key, value)
      api_call(:put, 'text', { key => value })
    end

    def destroy(*keys)
      api_call(:delete, 'data', nil, :query => { :keys => keys.flatten.join(',') })
    end
  end
end
