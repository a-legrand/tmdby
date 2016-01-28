require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestFind < MinitestWrapper

  def setup
    init_setup
    @find = Tmdby::Find
  end

  def test_get
    multi_assert @find.get("tt0266543", "imdb_id"),
                    uri: "http://api.themoviedb.org/3/find/tt0266543?external_source=imdb_id&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "movie_results"
  end

end
