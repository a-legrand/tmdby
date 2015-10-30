module Tmdby
  class Tv < Wrapper

    @root = "tv"

    # Get the primary information about a TV series by id.
    def self.get(id, optional_params = {})
      self.fetch id,
                  optional_params,
                  authorized_params: ["language", "append_to_response"]
    end

    # This method lets users get the status of whether or not the TV show has been rated or added to their favourite or watch lists.
    def self.account_states(id, session_id)
      self.fetch "#{id}/account_states",
                  session_id: session_id,
                  authorized_params: ["session_id"]
    end

    # Get the alternative titles for a specific show ID.
    def self.alternative_titles(id, optional_params = {})
      self.fetch "#{id}/alternative_titles",
                  optional_params,
                  authorized_params: ["country", "append_to_response"]
    end

    # Get the changes for a specific TV show id.
    def self.changes(id, optional_params = {})
      self.fetch "#{id}/changes",
                  optional_params,
                  authorized_params: ["start_date", "end_date"]
    end

    # Get the content ratings for a specific TV show id.
    def self.content_ratings(id)
      self.fetch "#{id}/content_ratings"
    end

    # Get the cast & crew information about a TV series.
    def self.credits(id, optional_params = {})
      self.fetch "#{id}/credits",
                  optional_params,
                  authorized_params: ["append_to_response"]
    end

    # Get the external ids that we have stored for a TV series.
    def self.external_ids(id, optional_params = {})
      self.fetch "#{id}/external_ids",
                  optional_params,
                  authorized_params: ["language"]
    end

    # Get the images (posters and backdrops) for a TV series.
    def self.images(id, optional_params = {})
      self.fetch "#{id}/images",
                  optional_params,
                  authorized_params: ["language", "include_image_language"]
    end

    # Get the plot keywords for a specific TV show id.
    def self.keywords(id, optional_params = {})
      self.fetch "#{id}/keywords",
                  optional_params,
                  authorized_params: ["append_to_response"]
    end

    # This method lets users rate a TV show.
    def self.rating(id, value, session_id, guest_session_id = nil)
      self.fetch "#{id}/rating",
                  method: 'post',
                  value: value,
                  session_id: session_id,
                  guest_session_id: guest_session_id,
                  post_params: ["value"],
                  authorized_params: ["session_id", "guest_session_id", "value"]
    end

    # This method lets users delete a TV rating.
    def self.delete_rating(id, session_id, guest_session_id = nil)
      self.fetch "#{id}/rating",
                  method: 'delete',
                  session_id: session_id,
                  guest_session_id: guest_session_id,
                  authorized_params: ["session_id", "guest_session_id"]
    end

    # Get the similar TV shows for a specific tv id.
    def self.similar(id, optional_params = {})
      self.fetch "#{id}/similar",
                  optional_params,
                  authorized_params: ["page", "language", "append_to_response"]
    end

    # Get the list of translations that exist for a TV series.
    def self.translations(id)
      self.fetch "#{id}/translations"
    end

    # Get the videos that have been added to a TV series (trailers, opening credits, etc...)
    def self.videos(id, optional_params = {})
      self.fetch "#{id}/videos",
                  optional_params,
                  authorized_params: ["language"]
    end

    # Get the latest TV show id.
    def self.latest
      self.fetch "latest"
    end

    # Get the list of TV shows that are currently on the air.
    def self.on_the_air(optional_params = {})
      self.fetch "on_the_air",
                  optional_params,
                  authorized_params: ["page", "language"]
    end

    # Get the list of TV shows that air today.
    def self.airing_today(optional_params = {})
      self.fetch "airing_today",
                  optional_params,
                  authorized_params: ["page", "language", "timezone"]
    end

    # Get the list of top rated TV shows.
    def self.top_rated(optional_params = {})
      self.fetch "top_rated",
                  optional_params,
                  authorized_params: ["page", "language"]
    end

    # Get the list of popular TV shows.
    def self.popular(optional_params = {})
      self.fetch "popular",
                  optional_params,
                  authorized_params: ["page", "language"]
    end

  end
end
