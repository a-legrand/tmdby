module Tmdby
  class Companies < Wrapper

    @root = "company"

    # This method is used to retrieve all of the basic information about a company.
    def self.get(id, optional_params = {})
      self.fetch id,
                  optional_params,
                  authorized_params: ["append_to_response"]
    end

    def self.movies(id, optional_params = {})
      self.fetch "#{id}/movies",
                  optional_params,
                  authorized_params: ["page", "language", "append_to_response"]
    end
  end
end
