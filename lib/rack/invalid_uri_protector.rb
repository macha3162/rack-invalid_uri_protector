require 'rack/invalid_uri_protector/version'
module Rack
  class InvalidUriProtector
    SANITIZE_ENV_KEYS = %w(
    HTTP_REFERER
    PATH_INFO
    REQUEST_URI
    REQUEST_PATH
    QUERY_STRING
  )

    def initialize(app)
      @app = app
    end

    def call(env)
      p '*' * 100
      SANITIZE_ENV_KEYS.each do |key|
       p string = env[key].to_s
        valid = URI.decode(string).force_encoding('UTF-8').valid_encoding?
        # Don't accept requests with invalid byte sequence
        return [400, {}, ['Bad request']] unless valid
      end

      @app.call(env)
    end
  end
end
