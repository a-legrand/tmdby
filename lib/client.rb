require "net/http"
require 'uri'
require_relative 'wrapper'
require_relative 'response'
Dir[File.join(File.dirname(__FILE__), 'wrappers', '*.rb')].each {|file| require file }

module Tmdby
  class Client
    @@api_key     = nil
    @@session_id  = nil
    @@api_url     = "http://api.themoviedb.org"
    @@api_version = 3

    def self.key=(key)
      @@api_key = key
    end

    def self.get(api_route, params = {})
      if @@api_key
        params[:api_key] = @@api_key

        uri = URI("#{@@api_url}/#{@@api_version}/#{api_route}?#{URI.encode_www_form(params)}")
        response = Net::HTTP.get_response(uri)

        if response.is_a? Net::HTTPSuccess
          Tmdby::Response.new(response)
        else
          raise RuntimeError, "An error has occured : #{response.body}"
        end
      else
        raise RuntimeError, 'An error has occured : please specify TMDB API KEY'
      end
    end
  end
end
