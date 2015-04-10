module Tmdby
  class Collections < Wrapper

    @root = "collection"

    # Get the basic collection information for a specific collection id.
    def self.get(id, params = {})
      self.fetch id,
                  params,
                  authorized_params: ["language", "append_to_response"]
    end

    # Get all of the images for a particular collection by collection id.
    def self.images(id, params = {})
      self.fetch "#{id}/images",
                  params,
                  authorized_params: ["language","append_to_response", "include_image_language"]
    end
  end
end
