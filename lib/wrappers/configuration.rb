module Tmdby
    class Configuration

        # Get the system wide configuration information
        # API reference : Updated on Dec. 13, 2013
        def self.get()
            Tmdby::Client.get "configuration"
        end
    end
end
