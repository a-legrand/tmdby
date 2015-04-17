require_relative 'wrapper'
require_relative 'client'
Dir[File.join(File.dirname(__FILE__), 'wrappers', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'helpers', '*.rb')].each {|file| require file }

module Tmdby
  class Init
    @@api_key     = nil
    @@default_language = nil

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
  end
end
