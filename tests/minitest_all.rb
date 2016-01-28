$:<< File.expand_path('../../lib', __FILE__)
require 'tmdby'

# A valid API_KEY is required to run the test suite
API_KEY = ENV['TMDB_API_KEY']

# A valid account is required to run the test suite
USERNAME = ENV['TMDB_USERNAME']
PASSWORD = ENV['TMDB_PASSWORD']
ACCOUNT_ID = 0

abort "Please configure your credentials as environment variables" unless
  (API_KEY and USERNAME and PASSWORD and ACCOUNT_ID and API_KEY)

# Monkey patch the Tmdby::Client class, so we won't reach the api rate limits
module Tmdby
  class Client
    class << self
      alias_method :real_api_call, :api_call

      def api_call(*args)
        $current_call = $current_call.to_i + 1
        sleep(10) if $current_call % 40 == 0
        real_api_call(*args)
      end
    end
  end
end

files = Dir.glob(File.expand_path(File.dirname(__FILE__)) + '/minitest/**/*.rb')

$current_test = 0;
files.each{|file| require file.gsub(/^minitest\/|.rb$/,'')}
