module Tmdby
  class Collections < Wrapper

    @root = "collection"

    # Get the basic collection information for a specific collection id.
    def self.get(id, optional_params = {})
      self.fetch id,
                  optional_params,
                  authorized_params: ["language", "append_to_response"]
    end

    # Get all of the images for a particular collection by collection id.
    def self.images(id, optional_params = {})
      self.fetch "#{id}/images",
                  optional_params,
                  authorized_params: ["language","append_to_response", "include_image_language"]
    end
  end
end
