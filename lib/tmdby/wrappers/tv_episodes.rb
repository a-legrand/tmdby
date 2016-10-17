module Tmdby
  class TvEpisodes < Wrapper

    @root = "tv"

    # Get the primary information about a TV episode by combination of a season and episode number.
    def self.get(id, season_number, episode_number, optional_params = {})
      self.fetch "#{id}/season/#{season_number}/episode/#{episode_number}",
                  optional_params,
                  authorized_params: ["language", "append_to_response"]
    end

    # Look up a TV episode's changes by episode ID.
    def self.changes(id, optional_params = {})
      self.fetch "episode/#{id}/changes",
                  optional_params,
                  authorized_params: ["start_date", "end_date", "page"]
    end

    # This method lets users get the status of whether or not the TV episode has been rated.
    def self.account_states(id, season_number, episode_number, session_id)
      self.fetch "#{id}/season/#{season_number}/episode/#{episode_number}/account_states",
                  session_id: session_id,
                  authorized_params: ["session_id"]
    end

    # Get the TV episode credits by combination of season and episode number.
    def self.credits(id, season_number, episode_number)
      self.fetch "#{id}/season/#{season_number}/episode/#{episode_number}/credits"
    end

    # Get the external ids for a TV episode by comabination of a season and episode number.
    def self.external_ids(id, season_number, episode_number, optional_params = {})
      self.fetch "#{id}/season/#{season_number}/episode/#{episode_number}/external_ids",
                  optional_params
    end

    # Get the images (episode stills) for a TV episode by combination of a season and episode number.
    def self.images(id, season_number, episode_number)
      self.fetch "#{id}/season/#{season_number}/episode/#{episode_number}/images"
    end

    # This method lets users rate a TV episode.
    def self.rating(id, season_number, episode_number, value, session_id, guest_session_id = nil)
      self.fetch "#{id}/season/#{season_number}/episode/#{episode_number}/rating",
                  method: 'post',
                  value: value,
                  session_id: session_id,
                  guest_session_id: guest_session_id,
                  post_params: ["value"],
                  authorized_params: ["session_id", "guest_session_id", "value"]
    end

    # This method lets users delete a TV episode rating.
    def self.delete_rating(id, season_number, episode_number, session_id, guest_session_id = nil)
      self.fetch "#{id}/season/#{season_number}/episode/#{episode_number}/rating",
                  method: 'delete',
                  session_id: session_id,
                  guest_session_id: guest_session_id,
                  authorized_params: ["session_id", "guest_session_id"]
    end

    # Get the videos that have been added to a TV episode (teasers, clips, etc...)
    def self.videos(id, season_number, episode_number, optional_params = {})
      self.fetch "#{id}/season/#{season_number}/episode/#{episode_number}/videos",
                  optional_params,
                  authorized_params: ["language"]
    end

  end
end
