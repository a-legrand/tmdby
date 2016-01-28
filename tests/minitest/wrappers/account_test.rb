require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestAccount < MinitestWrapper

  def setup
    init_setup
    @@session_id ||= Tmdby::Authentication.get_session_id USERNAME, PASSWORD
    @account = Tmdby::Account
  end

  def test_get
    multi_assert @account.get(@@session_id),
                  uri: "http://api.themoviedb.org/3/account?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200"
  end

  def test_lists
    multi_assert @account.lists(ACCOUNT_ID, @@session_id),
                  uri: "http://api.themoviedb.org/3/account/#{ACCOUNT_ID}/lists?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_favorite_movies
    multi_assert @account.favorite_movies(ACCOUNT_ID, @@session_id),
                  uri: "http://api.themoviedb.org/3/account/#{ACCOUNT_ID}/favorite/movies?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_favorite_tv
    multi_assert @account.favorite_tv(ACCOUNT_ID, @@session_id),
                  uri: "http://api.themoviedb.org/3/account/#{ACCOUNT_ID}/favorite/tv?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_favorite
    multi_assert @account.favorite(ACCOUNT_ID, @@session_id, "movie", 550, true),
                  uri: "http://api.themoviedb.org/3/account/#{ACCOUNT_ID}/favorite?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "POST",
                  post_params: {"media_type" => "movie", "media_id" => 550, "favorite" => true},
                  code: "201",
                  status_code: 12
  end

  def test_rated_movies
    multi_assert @account.rated_movies(ACCOUNT_ID, @@session_id),
                  uri: "http://api.themoviedb.org/3/account/#{ACCOUNT_ID}/rated/movies?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_rated_tv
    multi_assert @account.rated_tv(ACCOUNT_ID, @@session_id),
                  uri: "http://api.themoviedb.org/3/account/#{ACCOUNT_ID}/rated/tv?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_rated_tv_episodes
    multi_assert @account.rated_tv_episodes(ACCOUNT_ID, @@session_id),
                  uri: "http://api.themoviedb.org/3/account/#{ACCOUNT_ID}/rated/tv/episodes?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_watchlist_movies
    multi_assert @account.watchlist_movies(ACCOUNT_ID, @@session_id),
                  uri: "http://api.themoviedb.org/3/account/#{ACCOUNT_ID}/watchlist/movies?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_watchlist_tv
    multi_assert @account.watchlist_tv(ACCOUNT_ID, @@session_id),
                  uri: "http://api.themoviedb.org/3/account/#{ACCOUNT_ID}/watchlist/tv?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "GET",
                  code: "200",
                  includes: "results"
  end

  def test_watchlist
    multi_assert @account.watchlist(ACCOUNT_ID, @@session_id, "movie", 550, true),
                  uri: "http://api.themoviedb.org/3/account/#{ACCOUNT_ID}/watchlist?session_id=#{@@session_id}&api_key=#{API_KEY}",
                  http_verb: "POST",
                  post_params: {"media_type" => "movie", "media_id" => 550, "watchlist" => true},
                  code: "201",
                  status_code: 12
  end

end
