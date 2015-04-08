module Tmdby
  class Configuration < Wrapper
    @root = 'configuration'

    # Get the system wide configuration information
    # API reference : Updated on Dec. 13, 2013
    def self.get()
      self.fetch
    end
  end
end
