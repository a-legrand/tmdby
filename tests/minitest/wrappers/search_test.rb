require_relative 'minitest_wrapper.rb'

class TestSearch < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @search = Tmdby::Search
  end

  def test_company
    response = @search.company "warner"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/search/company?query=warner&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["results"]
  end

  def test_collection
    response = @search.collection "avenger"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/search/collection?query=avenger&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["results"]
  end

  def test_keyword
    response = @search.keyword "teen"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/search/keyword?query=teen&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["results"]
  end

  def test_list
    response = @search.list "warner"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/search/list?query=warner&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["results"]
  end

  def test_movie
    response = @search.movie "matrix"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/search/movie?query=matrix&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["results"]
  end

  def test_multi
    response = @search.multi "john"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/search/multi?query=john&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["results"]
  end

  def test_person
    response = @search.person "matthew perry"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/search/person?query=matthew+perry&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["results"]
  end

  def test_tv
    response = @search.tv "game of throne"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/search/tv?query=game+of+throne&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["results"]
  end

end
