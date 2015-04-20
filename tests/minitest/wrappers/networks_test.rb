require_relative 'minitest_wrapper.rb'

class TestNetworks < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @networks = Tmdby::Networks
  end

  def test_get
    response = @networks.get 1

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/network/1?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 1, response.body["id"]
  end

end
