module Tmdby
  class Authentication

    # Generate a session id using TMDB credentials
    def self.get_session_id(username, password)
      begin
        token = self.token_new.body["request_token"]
        self.token_validate_with_login token, username, password

        return (self.session_new token).body["session_id"]
      rescue
        return false
      end
    end

  end
end
