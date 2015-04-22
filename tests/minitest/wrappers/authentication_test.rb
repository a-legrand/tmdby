require_relative 'minitest_wrapper.rb'

class TestAuthentication < MinitestWrapper

  def setup
    init_setup
    @authentication = Tmdby::Authentication
  end

  def test_token_new
    multi_assert @authentication.token_new,
                    uri: "http://api.themoviedb.org/3/authentication/token/new?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_nil: "request_token"
  end

  def test_token_validate_with_login
    token = @authentication.token_new.body["request_token"]

    multi_assert @authentication.token_validate_with_login(token, USERNAME, PASSWORD),
                    uri: "http://api.themoviedb.org/3/authentication/token/validate_with_login?request_token=#{token}&username=#{USERNAME}&password=#{PASSWORD}&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_nil: "request_token",
                    must_be_true: "success"
  end

  def test_session_new
    token = @authentication.token_new.body["request_token"]
    @authentication.token_validate_with_login(token, USERNAME, PASSWORD)

    multi_assert @authentication.session_new(token),
                    uri: "http://api.themoviedb.org/3/authentication/session/new?request_token=#{token}&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_nil: "session_id",
                    must_be_true: "success"
  end

  def test_guest_session_new
    multi_assert @authentication.guest_session_new,
                    uri: "http://api.themoviedb.org/3/authentication/guest_session/new?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_nil: "guest_session_id",
                    must_be_true: "success"
  end

end
