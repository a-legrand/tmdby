require_relative 'minitest_wrapper.rb'

class TestReviews < MinitestWrapper

  def setup
    init_setup
    @reviews = Tmdby::Reviews
  end

  def test_get
    multi_assert @reviews.get("5013bc76760ee372cb00253e"),
                    uri: "http://api.themoviedb.org/3/review/5013bc76760ee372cb00253e?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: "5013bc76760ee372cb00253e"
  end

end
