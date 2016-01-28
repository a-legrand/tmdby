require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestTv < MinitestWrapper

  def setup
    init_setup
    @tv = Tmdby::Tv
  end

  def test_get
    multi_assert @tv.get(1396),
                    uri: "http://api.themoviedb.org/3/tv/1396?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 1396
  end

  def test_account_states
    session_id = Tmdby::Authentication.get_session_id USERNAME, PASSWORD

    multi_assert @tv.account_states(1396, session_id),
                  uri: "http://api.themoviedb.org/3/tv/1396/account_states?session_id=#{session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 1396,
                  includes: "rated"
  end

  def test_alternative_titles
    multi_assert @tv.alternative_titles(1396),
                  uri: "http://api.themoviedb.org/3/tv/1396/alternative_titles?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 1396,
                  not_empty: "results"
  end

  def test_changes
    multi_assert @tv.changes(1396),
                  uri: "http://api.themoviedb.org/3/tv/1396/changes?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "changes"
  end

  def test_content_ratings
    multi_assert @tv.content_ratings(1396),
                  uri: "http://api.themoviedb.org/3/tv/1396/content_ratings?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 1396,
                  not_empty: "results"
  end

  def test_credits
    multi_assert @tv.credits(1396),
                  uri: "http://api.themoviedb.org/3/tv/1396/credits?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 1396,
                  not_empty: "cast"
  end

  def test_external_ids
    response = @tv.external_ids(1396)

    multi_assert response,
                  uri: "http://api.themoviedb.org/3/tv/1396/external_ids?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 1396

    assert_equal "tt0903747", response.body["imdb_id"]
  end

  def test_images
    multi_assert @tv.images(1396),
                  uri: "http://api.themoviedb.org/3/tv/1396/images?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 1396,
                  not_empty: "backdrops"
  end

  def test_keywords
    multi_assert @tv.keywords(1396),
                  uri: "http://api.themoviedb.org/3/tv/1396/keywords?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 1396,
                  not_empty: "results"
  end

  def test_rating
    guest_session_id = Tmdby::Authentication.guest_session_new.body["guest_session_id"]

    multi_assert @tv.rating(1396, 8, nil, guest_session_id),
                  uri: "http://api.themoviedb.org/3/tv/1396/rating?guest_session_id=#{guest_session_id}&api_key=#{API_KEY}",
                  http_verb: "POST",
                  post_params: {"value" => 8},
                  code: "201",
                  status_code: 1
  end

  def test_delete_rating
    guest_session_id = Tmdby::Authentication.guest_session_new.body["guest_session_id"]

    @tv.rating(57243, 8, nil, guest_session_id)

    multi_assert @tv.delete_rating(57243, nil, guest_session_id),
                  uri: "http://api.themoviedb.org/3/tv/57243/rating?guest_session_id=#{guest_session_id}&api_key=#{API_KEY}",
                  http_verb: "DELETE",
                  code: "200",
                  status_code: 13
  end

  def test_similar
    multi_assert @tv.similar(1396),
                  uri: "http://api.themoviedb.org/3/tv/1396/similar?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  not_empty: "results"
  end

  def test_translations
    multi_assert @tv.translations(1396),
                  uri: "http://api.themoviedb.org/3/tv/1396/translations?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 1396,
                  not_empty: "translations"
  end

  def test_videos
    multi_assert @tv.videos(1396),
                  uri: "http://api.themoviedb.org/3/tv/1396/videos?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  id: 1396,
                  includes: "results"
  end

  def test_latest
    multi_assert @tv.latest,
                  uri: "http://api.themoviedb.org/3/tv/latest?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  not_nil: "id"
  end

  def test_on_the_air
    multi_assert @tv.on_the_air,
                  uri: "http://api.themoviedb.org/3/tv/on_the_air?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_airing_today
    multi_assert @tv.airing_today,
                  uri: "http://api.themoviedb.org/3/tv/airing_today?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_top_rated
    multi_assert @tv.top_rated,
                  uri: "http://api.themoviedb.org/3/tv/top_rated?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_popular
    multi_assert @tv.popular,
                  uri: "http://api.themoviedb.org/3/tv/popular?api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

end
