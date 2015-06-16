require_relative 'minitest_wrapper.rb'

class TestTvSeasons < MinitestWrapper

  def setup
    init_setup
    @tv_seasons = Tmdby::TvSeasons
  end

  def test_get
    multi_assert @tv_seasons.get(1396, 1),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 3572
  end

  def test_changes
    multi_assert @tv_seasons.changes(3572),
                  uri: "http://api.themoviedb.org/3/tv/season/3572/changes?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "changes"
  end

  def test_account_states
    session_id = Tmdby::Authentication.get_session_id USERNAME, PASSWORD

    multi_assert @tv_seasons.account_states(1396, 1, session_id),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/account_states?session_id=#{session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 3572,
                  not_empty: "results"
  end

  def test_credits
    multi_assert @tv_seasons.credits(1396, 1),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/credits?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 3572,
                  not_empty: "cast"
  end

  def test_external_ids
    response = @tv_seasons.external_ids 1396, 1

    multi_assert response,
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/external_ids?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 3572

    assert_equal 30272, response.body["tvdb_id"]
  end

  def test_images
    multi_assert @tv_seasons.images(1396, 1),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/images?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 3572,
                  not_empty: "posters"
  end

  def test_videos
    multi_assert @tv_seasons.videos(1396, 1),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/videos?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 3572,
                  includes: "results"
  end

end
