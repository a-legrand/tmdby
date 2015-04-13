module Tmdby
  class Authentication < Wrapper

    @root = "authentication"

    # This method is used to generate a valid request token for user based authentication.
    def self.token_new
      self.fetch "token/new"
    end

    # Once you have a valid request token you can use this method to authenticate a user with a TMDb username and password.
    def self.token_validate_with_login(request_token, username, password)
      self.fetch "token/validate_with_login",
                  request_token: request_token,
                  username: username,
                  password: password,
                  authorized_params: ["request_token", "username", "password"]
    end

    # This method is used to generate a session id for user based authentication.
    def self.session_new(request_token)
      self.fetch "session/new",
                  request_token: request_token,
                  authorized_params: ["request_token"]
    end

    # This method is used to generate a guest session id.
    def self.guest_session_new
      self.fetch "guest_session/new"
    end
  end
end
