module Tmdby
  class GuestSessions < Wrapper

    @root = "guest_session"

    # Get a list of rated movies for a specific guest session id.
    def self.rated_movies(guest_session_id, optional_params = {})
      self.fetch "#{guest_session_id}/rated_movies",
                  optional_params,
                  authorized_params: ["page", "language", "sort_by", "sort_order"]
    end
  end
end
