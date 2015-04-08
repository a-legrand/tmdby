module Tmdby
  class Timezones < Wrapper

    @root = "timezones"

    # Get the list of supported timezones for the API methods that support them
    def self.list
      self.fetch "list"
    end
  end
end
