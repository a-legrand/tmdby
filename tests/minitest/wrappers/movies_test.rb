require_relative 'minitest_wrapper.rb'

class TestMovies < MinitestWrapper

  def setup
    init_setup
    @movies = Tmdby::Movies
  end

  def test_get
    multi_assert @movies.get(550),
                    uri: "http://api.themoviedb.org/3/movie/550?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 550
  end

  def test_account_states
    session_id = Tmdby::Authentication.get_session_id USERNAME, PASSWORD

    multi_assert @movies.account_states(550, session_id),
                    uri: "http://api.themoviedb.org/3/movie/550/account_states?session_id=#{session_id}&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 550
  end

  def test_alternative_titles
    multi_assert @movies.alternative_titles(550),
                    uri: "http://api.themoviedb.org/3/movie/550/alternative_titles?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 550,
                    not_empty: "titles"
  end

  def test_credits
    multi_assert @movies.credits(550),
                    uri: "http://api.themoviedb.org/3/movie/550/credits?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 550,
                    not_empty: "cast"
  end

  def test_images
    multi_assert @movies.images(550),
                    uri: "http://api.themoviedb.org/3/movie/550/images?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 550,
                    not_empty: "backdrops"
  end

  def test_keywords
    multi_assert @movies.keywords(550),
                    uri: "http://api.themoviedb.org/3/movie/550/keywords?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 550,
                    not_empty: "keywords"
  end

  def test_releases
    multi_assert @movies.releases(550),
                    uri: "http://api.themoviedb.org/3/movie/550/releases?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 550,
                    not_empty: "countries"
  end

  def test_videos
    multi_assert @movies.videos(550),
                    uri: "http://api.themoviedb.org/3/movie/550/videos?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 550,
                    not_empty: "results"
  end

  def test_translations
    multi_assert @movies.translations(550),
                    uri: "http://api.themoviedb.org/3/movie/550/translations?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 550,
                    not_empty: "translations"
  end

  def test_similar
    multi_assert @movies.similar(550),
                    uri: "http://api.themoviedb.org/3/movie/550/similar?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

  def test_reviews
    multi_assert @movies.reviews(157336),
                    uri: "http://api.themoviedb.org/3/movie/157336/reviews?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 157336,
                    not_empty: "results"
  end

  def test_lists
    multi_assert @movies.lists(550),
                    uri: "http://api.themoviedb.org/3/movie/550/lists?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 550,
                    not_empty: "results"
  end

  def test_changes
    multi_assert @movies.changes(550),
                    uri: "http://api.themoviedb.org/3/movie/550/changes?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "changes"
  end

  def test_rating
    guest_session_id = Tmdby::Authentication.guest_session_new.body["guest_session_id"]

    multi_assert @movies.rating(551, 9, nil, guest_session_id),
                  uri: "http://api.themoviedb.org/3/movie/551/rating?guest_session_id=#{guest_session_id}&api_key=#{API_KEY}",
                  http_verb: "POST",
                  post_params: {"value" => 9},
                  code: "201",
                  status_code: 1
  end

  def test_delete_rating
    guest_session_id = Tmdby::Authentication.guest_session_new.body["guest_session_id"]

    @movies.rating(600, 9, nil, guest_session_id)

    multi_assert @movies.delete_rating(600, nil, guest_session_id),
                  uri: "http://api.themoviedb.org/3/movie/600/rating?guest_session_id=#{guest_session_id}&api_key=#{API_KEY}",
                  http_verb: "DELETE",
                  code: "200",
                  status_code: 13
  end

  def test_latest
    multi_assert @movies.latest,
                    uri: "http://api.themoviedb.org/3/movie/latest?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_nil: "id"
  end

  def test_upcoming
    multi_assert @movies.upcoming,
                    uri: "http://api.themoviedb.org/3/movie/upcoming?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "results"
  end

  def test_now_playing
    multi_assert @movies.now_playing,
                    uri: "http://api.themoviedb.org/3/movie/now_playing?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "results"
  end

  def test_popular
    multi_assert @movies.popular,
                    uri: "http://api.themoviedb.org/3/movie/popular?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "results"
  end

  def test_top_rated
    multi_assert @movies.top_rated,
                    uri: "http://api.themoviedb.org/3/movie/top_rated?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "results"
  end


end
