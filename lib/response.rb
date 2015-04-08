require 'json'

module Tmdby
  class Response
    attr_reader :code, :raw_body, :body, :headers

    def initialize(response)
      @code = response.code
      @headers = response.to_hash
      @raw_body = response.body
      @body = JSON.parse(response.body)
    end
  end
end
