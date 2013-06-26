module Cloudmine
  class Object < Base
    def fetch(*keys)
      api_call(:get, 'text', :query => { :keys => keys.flatten.join(',') })["success"]
    end

    def update(key, value, options = {})
      api_call(:post, 'text', :body => { key => value })
    end

    def create(key, value)
      api_call(:put, 'text', :body => { key => value })
    end

    def destroy(*keys)
      api_call(:delete, 'data', :query => { :keys => keys.flatten.join(',') })
    end
  end
end
