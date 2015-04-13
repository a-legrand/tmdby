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

    # Check to see if a movie ID is already added to a list.
    def self.item_status(id, movie_id)
      self.fetch "#{id}/item_status",
                  movie_id: movie_id,
                  authorized_params: ["movie_id"]
    end

    # This method lets users create a new list.
    def self.new(session_id, name, description, optional_params = {})
      self.fetch "",
                  optional_params,
                  method: 'post',
                  session_id: session_id,
                  name: name,
                  description: description,
                  post_params: ["name", "description", "language"],
                  authorized_params: ["session_id", "name", "description", "language"]
    end

    # This method lets users add new movies to a list that they created.
    def self.add_item(id, session_id, media_id)
      self.fetch "#{id}/add_item",
                  method: 'post',
                  media_id: media_id,
                  session_id: session_id,
                  post_params: ["media_id"],
                  authorized_params: ["session_id", "media_id"]
    end

    # This method lets users delete movies from a list that they created.
    def self.remove_item(id, session_id, media_id)
      self.fetch "#{id}/remove_item",
                  method: 'post',
                  media_id: media_id,
                  session_id: session_id,
                  post_params: ["media_id"],
                  authorized_params: ["session_id", "media_id"]
    end

    # Clear all of the items within a list.
    def self.clear(id, session_id, confirm = true)
      self.fetch "#{id}/clear",
                  method: 'post',
                  session_id: session_id,
                  confirm: confirm,
                  authorized_params: ["session_id", "confirm"]
    end
  end
end
