require_relative 'minitest_wrapper.rb'

class TestDiscover < MinitestWrapper

  def setup
    init_setup
    @discover = Tmdby::Discover
  end

  def test_movie
    multi_assert @discover.movie(year: 1994, with_cast: 1269),
                    uri: "http://api.themoviedb.org/3/discover/movie?year=1994&with_cast=1269&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

  def test_tv
    multi_assert @discover.tv(first_air_date_year: 1994, 'language' => 'fr'),
                    uri: "http://api.themoviedb.org/3/discover/tv?first_air_date_year=1994&language=fr&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

end
