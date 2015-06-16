module Tmdby
  class People < Wrapper

    @root = "person"

    # Get the general person information for a specific id.
    def self.get(id, optional_params = {})
      self.fetch id,
                  optional_params,
                  authorized_params: ["append_to_response"]
    end

    # Get the movie credits for a specific person id.
    def self.movie_credits(id, optional_params = {})
      self.fetch "#{id}/movie_credits",
                  optional_params,
                  authorized_params: ["language", "append_to_response"]
    end

    # Get the TV credits for a specific person id.
    def self.tv_credits(id, optional_params = {})
      self.fetch "#{id}/tv_credits",
                  optional_params,
                  authorized_params: ["language", "append_to_response"]
    end

    # Get the combined (movie and TV) credits for a specific person id.
    def self.combined_credits(id, optional_params = {})
      self.fetch "#{id}/combined_credits",
                  optional_params,
                  authorized_params: ["language", "append_to_response"]
    end

    # Get the external ids for a specific person id.
    def self.external_ids(id)
      self.fetch "#{id}/external_ids"
    end

    # Get the images for a specific person id.
    def self.images(id)
      self.fetch "#{id}/images"
    end

    # Get the images that have been tagged with a specific person id.
    def self.tagged_images(id, optional_params = {})
      self.fetch "#{id}/tagged_images",
                  optional_params,
                  authorized_params: ["language", "page"]
    end

    # Get the changes for a specific person id.
    def self.changes(id, optional_params = {})
      self.fetch "#{id}/changes",
                  optional_params,
                  authorized_params: ["start_date", "end_date"]
    end

    # Get the list of popular people on The Movie Database.
    def self.popular(optional_params = {})
      self.fetch "popular",
                  optional_params,
                  authorized_params: ["page"]
    end

    # Get the latest person id.
    def self.latest
      self.fetch "latest"
    end

  end
end
