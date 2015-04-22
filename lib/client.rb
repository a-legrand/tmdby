require "net/http"
require 'uri'
require_relative 'response'

module Tmdby
  class Client
    @@netloc     = "api.themoviedb.org/3"

    # Returns complete api route to call
    def self.get_uri(api_route, params = {})
      params["api_key"] = Tmdby::Setup.key

      URI("#{Tmdby::Setup.api_scheme}://#{@@netloc}/#{api_route}?#{URI.encode_www_form(params)}")
    end


    def self.api_call(method_call, api_route, params = {}, post_params = {})
      if Tmdby::Setup.key
        uri = self.get_uri api_route, params
        # puts "[#{method_call}] #{uri}"

        case method_call
        when "get"
          response = Net::HTTP.get_response(uri)
        when "post"
          response = Net::HTTP.post_form(uri, post_params)
        when "delete"
          response = Net::HTTP.new(uri.host, uri.port).delete("#{uri.path}?#{uri.query}")
        else
          raise RuntimeError, "An error has occured : \"#{method_call}\" is unknown method_call"
        end

        if response.is_a? Net::HTTPSuccess
          Tmdby::Response.new(response, uri, method_call, post_params)
        else
          raise RuntimeError, "An error has occured : #{response.body}"
        end
      else
        raise RuntimeError, 'An error has occured : please specify TMDB API KEY'
      end
    end
  end
end
