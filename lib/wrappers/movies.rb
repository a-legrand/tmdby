module Tmdby
    class Movies
        def self.get(id)
            Tmdby::Client.get("movie/#{id}")
        end
    end
end
