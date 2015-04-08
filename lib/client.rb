require "net/http"
require 'uri'
require_relative 'wrapper'
require_relative 'response'
Dir[File.join(File.dirname(__FILE__), 'wrappers', '*.rb')].each {|file| require file }

module Tmdby
  class Client
    @@api_key     = ""
    @@session_id  = ""
    @@api_url     = "http://api.themoviedb.org"
    @@api_version = 3

    def self.key=(key)
      @@api_key = key
    end

    def self.get(api_route, params = {})
      if @@api_key
        params[:api_key] = @@api_key

        uri = URI("#{@@api_url}/#{@@api_version}/#{api_route}?#{URI.encode_www_form(params)}")
        puts uri
        response = Net::HTTP.get_response(uri)

        Tmdby::Response.new(response)

      else
        raise RuntimeError, 'An error has occured : please specify TMDB API KEY' unless @@api_key
      end
    end
  end
end
