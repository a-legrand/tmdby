require 'json'

module Tmdby
  class Response
    attr_reader :code, :raw_body, :body, :headers, :uri, :http_verb

    def initialize(response, uri, http_verb)
      @code = response.code
      @headers = response.to_hash
      @raw_body = response.body
      @body = JSON.parse(response.body)
      @uri = uri
      @http_verb = http_verb.upcase
    end
  end
end
