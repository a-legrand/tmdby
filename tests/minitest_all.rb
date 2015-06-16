$:<< File.expand_path('../../lib', __FILE__)

require_relative 'credentials'

if not (API_KEY and USERNAME and PASSWORD and ACCOUNT_ID and API_KEY != "")
  credentials_file = File.expand_path('credentials.rb', File.dirname(__FILE__))
  $stderr.puts "Please configure your credentials in #{credentials_file}"
  exit
end

files = Dir.glob(File.expand_path(File.dirname(__FILE__)) + '/minitest/**/*.rb')

files.each{|file| require file.gsub(/^minitest\/|.rb$/,'')}
