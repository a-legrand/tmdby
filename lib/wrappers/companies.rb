module Tmdby
  class Companies < Wrapper

    @root = "company"

    # This method is used to retrieve all of the basic information about a company.
    def self.get(id, params = {})
      self.fetch id,
                  params,
                  authorized_params: ["append_to_response"]
    end

    def self.movies(id, params = {})
      self.fetch "#{id}/movies",
                  params,
                  authorized_params: ["page", "language", "append_to_response"]
    end
  end
end
