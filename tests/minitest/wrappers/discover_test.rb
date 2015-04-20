require_relative 'minitest_wrapper.rb'

class TestDiscover < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @discover = Tmdby::Discover
  end

  def test_movie
    response = @discover.movie year: 1994, with_cast: 1269

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/discover/movie?year=1994&with_cast=1269&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body, "results"
  end

  def test_tv
    response = @discover.tv first_air_date_year: 1994, 'language' => 'fr'

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/discover/tv?first_air_date_year=1994&language=fr&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body, "results"
  end

end
