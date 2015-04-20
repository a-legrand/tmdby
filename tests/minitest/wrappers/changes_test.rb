require_relative 'minitest_wrapper.rb'

class TestChanges < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @changes = Tmdby::Changes
  end

  def test_movie
    response = @changes.movie

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/movie/changes?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_includes response.body, "results"
  end

  def test_person
    response = @changes.person

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/changes?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_includes response.body, "results"
  end

  def test_tv
    response = @changes.tv

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/tv/changes?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_includes response.body, "results"
  end


end
