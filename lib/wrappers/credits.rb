module Tmdby
    class Credits

        # Get the detailed information about a particular credit record
        def self.get(credit_id, language = nil)
            Tmdby::Client.get "credit/#{credit_id}", {:language => language}
        end
    end
end
