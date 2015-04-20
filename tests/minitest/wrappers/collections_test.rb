require_relative 'minitest_wrapper.rb'

class TestCollections < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @collections = Tmdby::Collections
  end

  def test_get
    response = @collections.get 10

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/collection/10?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 10, response.body["id"]
    refute_empty response.body["parts"]
  end

  def test_images
    response = @collections.images 10

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/collection/10/images?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 10, response.body["id"]
    refute_empty response.body["backdrops"]
  end


end
