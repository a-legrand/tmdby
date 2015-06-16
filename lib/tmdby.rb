require "tmdby/version"

require_relative 'tmdby/wrapper'
require_relative 'tmdby/client'
Dir[File.join(File.dirname(__FILE__), 'tmdby', 'wrappers', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'tmdby', 'helpers', '*.rb')].each {|file| require file }


module Tmdby
  class Setup
    @@api_key     = nil
    @@default_language = nil
    @@api_scheme = 'http'

    # Set TMDB API Key
    def self.key=(key)
      @@api_key = key
    end

    def self.key
      @@api_key
    end

    # Set default language
    def self.default_language=(language)
      @@default_language = language
    end

    def self.default_language
      @@default_language
    end

    def self.api_scheme
      @@api_scheme
    end

    # Set secure mode OFF
    def self.secure=(secure)
      @@api_scheme =
        if not secure
          'http'
        else
          'https'
        end
    end
  end
end
