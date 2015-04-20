$:<<'..'
$:<<'minitest'
files = Dir.glob('minitest/**/*.rb')

API_KEY = "436c28b058699920fdf3d084c9ac27bc"

files.each{|file| require file.gsub(/^minitest\/|.rb$/,'')}
