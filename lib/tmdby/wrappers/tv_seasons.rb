module Tmdby
  class TvSeasons < Wrapper

    @root = "tv"

    # Get the primary information about a TV season by its season number.
    def self.get(id, season_id, optional_params = {})
      self.fetch "#{id}/season/#{season_id}",
                  optional_params,
                  authorized_params: ["language", "append_to_response"]
    end

    # Look up a TV season's changes by season ID.
    def self.changes(id, optional_params = {})
      self.fetch "season/#{id}/changes",
                  optional_params,
                  authorized_params: ["start_date", "end_date"]
    end

    # This method lets users get the status of whether or not the TV episodes of a season have been rated.
    def self.account_states(id, season_number, session_id)
      self.fetch "#{id}/season/#{season_number}/account_states",
                  session_id: session_id,
                  authorized_params: ["session_id"]
    end

    # Get the cast & crew credits for a TV season by season number.
    def self.credits(id, season_number)
      self.fetch "#{id}/season/#{season_number}/credits"
    end

    # Get the primary information about a TV season by its season number.
    def self.external_ids(id, season_number, optional_params = {})
      self.fetch "#{id}/season/#{season_number}/external_ids",
                  optional_params,
                  authorized_params: ["external_ids"]
    end

    # Get the images (posters) that we have stored for a TV season by season number.
    def self.images(id, season_number, optional_params = {})
      self.fetch "#{id}/season/#{season_number}/images",
                  optional_params,
                  authorized_params: ["language", "include_image_language"]
    end

    # Get the videos that have been added to a TV season (trailers, teasers, etc...)
    def self.videos(id, season_number, optional_params = {})
      self.fetch "#{id}/season/#{season_number}/videos",
                  optional_params,
                  authorized_params: ["language"]
    end

  end
end
