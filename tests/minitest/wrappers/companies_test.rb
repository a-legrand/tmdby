require_relative 'minitest_wrapper.rb'

class TestCompanies < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @companies = Tmdby::Companies
  end

  def test_get
    response = @companies.get 1

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/company/1?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 1, response.body["id"]
    assert_equal "Lucasfilm", response.body["name"]
  end

  def test_movies
    response = @companies.movies 1

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/company/1/movies?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 1, response.body["id"]
    refute_empty response.body["results"]
  end


end
