module Tmdby
    class Jobs

        # Get a list of valid jobs
        def self.list
            Tmdby::Client.get "job/list"
        end
    end
end
