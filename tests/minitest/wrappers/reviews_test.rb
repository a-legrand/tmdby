require_relative 'minitest_wrapper.rb'

class TestReviews < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @reviews = Tmdby::Reviews
  end

  def test_get
    response = @reviews.get "5013bc76760ee372cb00253e"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/review/5013bc76760ee372cb00253e?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal "5013bc76760ee372cb00253e", response.body["id"]
  end

end
