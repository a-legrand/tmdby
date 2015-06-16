module Tmdby
  class Keywords < Wrapper

    @root = "keyword"

    # Get the basic information for a specific keyword id.
    def self.get(id)
      self.fetch id
    end

    # Get the list of movies for a particular keyword by id.
    def self.movies(id, optional_params = {})
      self.fetch "#{id}/movies",
                  optional_params,
                  authorized_params: ["page", "language"]
    end
  end
end
