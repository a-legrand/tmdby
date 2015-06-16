require_relative 'minitest_wrapper.rb'

class TestKeywords < MinitestWrapper

  def setup
   init_setup
    @keywords = Tmdby::Keywords
  end

  def test_get
    multi_assert @keywords.get(1721),
                    uri: "http://api.themoviedb.org/3/keyword/1721?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 1721
  end

  def test_movies
    multi_assert @keywords.movies(1721),
                    uri: "http://api.themoviedb.org/3/keyword/1721/movies?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 1721,
                    not_empty: "results"
  end

end
