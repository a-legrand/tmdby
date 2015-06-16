module Tmdby
  class Movies < Wrapper

    @root = "movie"

    # Get the basic movie information for a specific movie id.
    def self.get(id, optional_params = {})
      self.fetch id,
                  optional_params,
                  authorized_params: ["language", "append_to_response"]
    end

    # This method lets a TMDb user account get the status of whether or not the movie has been rated or added to their favourite or movie watch list.
    def self.account_states(id, session_id)
      self.fetch "#{id}/account_states",
                  session_id: session_id,
                  authorized_params: ["session_id"]
    end

    # Get the alternative titles for a specific movie id.
    def self.alternative_titles(id, optional_params = {})
      self.fetch "#{id}/alternative_titles",
                  optional_params,
                  authorized_params: ["country", "append_to_response"]
    end

    # Get the cast and crew information for a specific movie id.
    def self.credits(id, optional_params = {})
      self.fetch "#{id}/credits",
                  optional_params,
                  authorized_params: ["append_to_response"]
    end

    # Get the images (posters and backdrops) for a specific movie id.
    def self.images(id, optional_params = {})
      self.fetch "#{id}/images",
                  optional_params,
                  authorized_params: ["language", "append_to_response", "include_image_language"]
    end

    # Get the plot keywords for a specific movie id.
    def self.keywords(id, optional_params = {})
      self.fetch "#{id}/keywords",
                  optional_params,
                  authorized_params: ["append_to_response"]
    end

    # Get the release date and certification information by country for a specific movie id.
    def self.releases(id, optional_params = {})
      self.fetch "#{id}/releases",
                  optional_params,
                  authorized_params: ["append_to_response"]
    end

    # Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
    def self.videos(id, optional_params = {})
      self.fetch "#{id}/videos",
                  optional_params,
                  authorized_params: ["language", "append_to_response"]
    end

    # Get the translations for a specific movie id.
    def self.translations(id, optional_params = {})
      self.fetch "#{id}/translations",
                  optional_params,
                  authorized_params: ["append_to_response"]
    end

    # Get the similar movies for a specific movie id.
    def self.similar(id, optional_params = {})
      self.fetch "#{id}/similar",
                  optional_params,
                  authorized_params: ["page", "language", "append_to_response"]
    end

    # Get the reviews for a particular movie id.
    def self.reviews(id, optional_params = {})
      self.fetch "#{id}/reviews",
                  optional_params,
                  authorized_params: ["page", "language", "append_to_response"]
    end

    # Get the lists that the movie belongs to.
    def self.lists(id, optional_params = {})
      self.fetch "#{id}/lists",
                  optional_params,
                  authorized_params: ["page", "language", "append_to_response"]
    end

    # Get the changes for a specific movie id.
    def self.changes(id, optional_params = {})
      self.fetch "#{id}/changes",
                  optional_params,
                  authorized_params: ["start_date", "end_date"]
    end

    # This method lets users rate a movie.
    def self.rating(id, value, session_id, guest_session_id = nil)
      self.fetch "#{id}/rating",
                  method: 'post',
                  value: value,
                  session_id: session_id,
                  guest_session_id: guest_session_id,
                  post_params: ["value"],
                  authorized_params: ["session_id", "guest_session_id", "value"]
    end

    # Get the latest movie id.
    def self.latest
      self.fetch "latest"
    end

    # Get the list of upcoming movies by release date.
    def self.upcoming(optional_params = {})
      self.fetch "upcoming",
                  optional_params,
                  authorized_params: ["page", "language"]
    end

    # Get the list of movies playing that have been, or are being released this week.
    def self.now_playing(optional_params = {})
      self.fetch "now_playing",
                  optional_params,
                  authorized_params: ["page", "language"]
    end

    # Get the list of popular movies on The Movie Database.
    def self.popular(optional_params = {})
      self.fetch "popular",
                  optional_params,
                  authorized_params: ["page", "language"]
    end

    # Get the list of top rated movies.
    def self.top_rated(optional_params = {})
      self.fetch "top_rated",
                  optional_params,
                  authorized_params: ["page", "language"]
    end


  end
end
