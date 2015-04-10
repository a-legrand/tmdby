module Tmdby
  class Lists < Wrapper

    @root = "list"

    # Get a list by id.
    def self.get(id)
      self.fetch id
    end

    # Delete a list by id.
    def self.delete(id) # TODO
      self.fetch id, method: "delete"
    end

    def self.item_status(id, movie_id)
      self.fetch "#{id}/item_status",
                  movie_id: movie_id,
                  authorized_params: ["movie_id"]
    end
  end
end
