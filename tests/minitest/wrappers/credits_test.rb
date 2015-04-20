require_relative 'minitest_wrapper.rb'

class TestCredits < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @credits = Tmdby::Credits
  end

  def test_get
    response = @credits.get "52542282760ee313280017f9"

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/credit/52542282760ee313280017f9?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal "cast", response.body["credit_type"]
    refute_empty response.body["media"]
  end

end
