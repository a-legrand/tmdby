require_relative 'minitest_wrapper.rb'

class TestCredits < MinitestWrapper

  def setup
    init_setup
    @credits = Tmdby::Credits
  end

  def test_get
    response = @credits.get "52542282760ee313280017f9"

    multi_assert response,
                    uri: "http://api.themoviedb.org/3/credit/52542282760ee313280017f9?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "media"

    assert_equal "cast", response.body["credit_type"]
  end

end
