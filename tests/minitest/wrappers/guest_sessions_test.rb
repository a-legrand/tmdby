require_relative 'minitest_wrapper.rb'

class TestGuestSessions < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil

    @guest_sessions = Tmdby::GuestSessions
  end

  def test_rated_movies
    # First we create a new guest_session_id
    guest_session_id = Tmdby::Authentication.guest_session_new.body["guest_session_id"]

    response = @guest_sessions.rated_movies guest_session_id

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/guest_session/#{guest_session_id}/rated_movies?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    # We verify this account never rate a movie
    assert_empty response.body["results"]

    # We rate a movie
    Tmdby::Movies.rating 550, 6, nil, guest_session_id

    sleep 5

    response = @guest_sessions.rated_movies guest_session_id

    # We verify this account rate a movie
    refute_empty response.body["results"]
    assert_equal 1, response.body["total_results"]
  end

end
