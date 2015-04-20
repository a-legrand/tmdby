require_relative 'minitest_wrapper.rb'

class TestKeywords < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @keywords = Tmdby::Keywords
  end

  def test_get
    response = @keywords.get 1721

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/keyword/1721?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 1721, response.body["id"]
  end

  def test_movies
    response = @keywords.movies 1721

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/keyword/1721/movies?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 1721, response.body["id"]
    refute_empty response.body["results"]
  end

end
