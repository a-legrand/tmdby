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

    def self.api_call(method_call, api_route, params = {}, post_param_names = {})
      if @@api_key
        params[:api_key] = @@api_key

        # Here we move all parameters listed in "post_param_names" from "params" to "post_params" new hash
        post_params = {}
        post_param_names.each do |k|
          if params.include? k
            post_params[k] = params[k]
            params.delete(k)
          elsif params.include? k.to_sym
            post_params[k] = params[k.to_sym]
            params.delete(k.to_sym)
          end
        end

        uri = URI("#{@@api_url}/#{@@api_version}/#{api_route}?#{URI.encode_www_form(params)}")
        puts "[#{method_call}] #{uri}"

        case method_call
        when "get"
          response = Net::HTTP.get_response(uri)
        when "delete"
          # http = Net::HTTP.new(@@api_url)
          # req = Net::HTTP::Delete.new(path)
          # response = http.request(req)
          # pp uri.host
          # pp "#{uri.path}?#{uri.query}"
          response = Net::HTTP.new(uri.host, uri.port).delete("#{uri.path}?#{uri.query}")
          pp response
        when "post"
          response = Net::HTTP.post_form(uri, post_params)
        end

        if response.is_a? Net::HTTPSuccess
          Tmdby::Response.new(response, uri, method_call)
        else
          raise RuntimeError, "An error has occured : #{response.body}"
        end
      else
        raise RuntimeError, 'An error has occured : please specify TMDB API KEY'
      end
    end
  end
end
