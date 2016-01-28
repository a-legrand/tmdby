require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestChanges < MinitestWrapper

  def setup
    init_setup
    @changes = Tmdby::Changes
  end

  def test_movie
    multi_assert @changes.movie,
                    uri: "http://api.themoviedb.org/3/movie/changes?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "results"
  end

  def test_person
    multi_assert @changes.person,
                    uri: "http://api.themoviedb.org/3/person/changes?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "results"
  end

  def test_tv
    multi_assert @changes.tv,
                    uri: "http://api.themoviedb.org/3/tv/changes?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "results"
  end

end
