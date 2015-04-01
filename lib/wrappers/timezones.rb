module Tmdby
    class Timezones

        # Get the list of supported timezones for the API methods that support them
        def self.list
            Tmdby::Client.get "timezones/list"
        end
    end
end
