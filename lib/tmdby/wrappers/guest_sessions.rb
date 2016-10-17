module Tmdby
  class GuestSessions < Wrapper

    @root = "guest_session"

    # Get the rated movies for a guest session.
    def self.rated_movies(guest_session_id, optional_params = {})
      self.fetch "#{guest_session_id}/rated/movies",
                  optional_params,
                  authorized_params: ["page", "language", "sort_by", "sort_order"]
    end

    # Get the rated TV shows for a guest session.
    def self.rated_tv(guest_session_id, optional_params = {})
      self.fetch "#{guest_session_id}/rated/tv",
                  optional_params,
                  authorized_params: ["page", "language", "sort_by", "sort_order"]
    end

    # Get the rated TV episodes for a guest session.
    def self.rated_tv_episodes(guest_session_id, optional_params = {})
      self.fetch "#{guest_session_id}/rated/tv/episodes",
                  optional_params,
                  authorized_params: ["page", "language", "sort_by", "sort_order"]
    end
  end
end
