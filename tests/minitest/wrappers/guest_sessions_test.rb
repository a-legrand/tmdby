require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestGuestSessions < MinitestWrapper

  def setup
    init_setup
    @guest_sessions = Tmdby::GuestSessions
  end

  def test_rated_movies
    guest_session_id = Tmdby::Authentication.guest_session_new.body["guest_session_id"]

    multi_assert @guest_sessions.rated_movies(guest_session_id),
                    uri: "http://api.themoviedb.org/3/guest_session/#{guest_session_id}/rated_movies?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "results"
  end

end
