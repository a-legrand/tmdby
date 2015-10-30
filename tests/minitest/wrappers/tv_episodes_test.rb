require_relative 'minitest_wrapper.rb'

class TestTvEpisodes < MinitestWrapper

  def setup
    init_setup
    @tv_episodes = Tmdby::TvEpisodes
  end

  def test_get
    multi_assert @tv_episodes.get(1396, 1, 1),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/episode/1?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 62085
  end

  def test_changes
    multi_assert @tv_episodes.changes(62085),
                  uri: "http://api.themoviedb.org/3/tv/episode/62085/changes?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "changes"
  end

  def test_account_states
    session_id = Tmdby::Authentication.get_session_id USERNAME, PASSWORD

    multi_assert @tv_episodes.account_states(1396, 1, 7, session_id),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/episode/7/account_states?session_id=#{session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 62091,
                  includes: "rated"
  end

  def test_credits
    multi_assert @tv_episodes.credits(1396, 1, 1),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/episode/1/credits?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 62085,
                  not_empty: "cast"
  end

  def test_external_ids
    response = @tv_episodes.external_ids 1396, 1, 1

    multi_assert response,
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/episode/1/external_ids?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 62085

    assert_equal "tt0959621", response.body["imdb_id"]
  end

  def test_images
    multi_assert @tv_episodes.images(1396, 1, 1),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/episode/1/images?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 62085,
                  not_empty: "stills"
  end

  def test_rating
    guest_session_id = Tmdby::Authentication.guest_session_new.body["guest_session_id"]

    multi_assert @tv_episodes.rating(1396, 1, 1, 8, nil, guest_session_id),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/episode/1/rating?guest_session_id=#{guest_session_id}&api_key=#{API_KEY}",
                  http_verb: "POST",
                  post_params: {"value" => 8},
                  code: "201",
                  status_code: 1
  end

  def test_delete_rating
    guest_session_id = Tmdby::Authentication.guest_session_new.body["guest_session_id"]

    @tv_episodes.rating(57243, 1, 1, 8, nil, guest_session_id)

    multi_assert @tv_episodes.delete_rating(57243, 1, 1, nil, guest_session_id),
                  uri: "http://api.themoviedb.org/3/tv/57243/season/1/episode/1/rating?guest_session_id=#{guest_session_id}&api_key=#{API_KEY}",
                  http_verb: "DELETE",
                  code: "200",
                  status_code: 13
  end

  def test_videos
    multi_assert @tv_episodes.videos(1396, 1, 1),
                  uri: "http://api.themoviedb.org/3/tv/1396/season/1/episode/1/videos?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 62085,
                  includes: "results"
  end

end
