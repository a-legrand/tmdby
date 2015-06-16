require_relative 'minitest_wrapper.rb'

class TestSearch < MinitestWrapper

  def setup
    init_setup
    @search = Tmdby::Search
  end

  def test_company
    multi_assert @search.company("warner"),
                    uri: "http://api.themoviedb.org/3/search/company?query=warner&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

  def test_collection
    multi_assert @search.collection("avenger"),
                    uri: "http://api.themoviedb.org/3/search/collection?query=avenger&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

  def test_keyword
    multi_assert @search.keyword("teen"),
                    uri: "http://api.themoviedb.org/3/search/keyword?query=teen&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

  def test_list
    multi_assert @search.list("warner"),
                    uri: "http://api.themoviedb.org/3/search/list?query=warner&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

  def test_movie
    multi_assert @search.movie("matrix"),
                    uri: "http://api.themoviedb.org/3/search/movie?query=matrix&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

  def test_multi
    multi_assert @search.multi("john"),
                    uri: "http://api.themoviedb.org/3/search/multi?query=john&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

  def test_person
    multi_assert @search.person("matthew perry"),
                    uri: "http://api.themoviedb.org/3/search/person?query=matthew+perry&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

  def test_tv
    multi_assert @search.tv("game of throne"),
                    uri: "http://api.themoviedb.org/3/search/tv?query=game+of+throne&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

end
