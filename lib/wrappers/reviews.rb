module Tmdby
    class Reviews

        # Get the full details of a review by ID
        def self.get(id)
            Tmdby::Client.get "review/#{id}"
        end
    end
end
