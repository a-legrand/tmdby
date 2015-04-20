require_relative 'minitest_wrapper.rb'

class TestFind < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @find = Tmdby::Find
  end

  def test_get
    response = @find.get "tt0266543", "imdb_id"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/find/tt0266543?external_source=imdb_id&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_includes response.body, "movie_results"
  end

end
