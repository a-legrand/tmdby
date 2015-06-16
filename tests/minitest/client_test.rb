require 'minitest/autorun'
require 'tmdby'

class TestClient < Minitest::Test

  def setup
    Tmdby::Setup.key = nil
    Tmdby::Setup.default_language = nil

    @client = Tmdby::Client
  end

  def test_get_uri
    Tmdby::Setup.key = "key"
    route = "route/hello"
    params = {"k1" => "v1", "k2" =>"v2"}

    assert_equal "http://api.themoviedb.org/3/route/hello?k1=v1&k2=v2&api_key=key", @client.get_uri(route, params).to_s
  end

  def test_call
    # api_key is required
    assert_raises(RuntimeError) do
      @client.api_call('get', "")
    end

    # valid api_key is required
    Tmdby::Setup.key = "invalid_key"
    params = {"k1" => "v1", "k2" =>"v2"}
    assert_raises(RuntimeError) do
      @client.api_call('get', '', params)
    end

    # valid method_call is required
    Tmdby::Setup.key = API_KEY
    assert_raises(RuntimeError) do
      @client.api_call('this_is_invalid_method_call', '')
    end

    # valid api route ressource is required
    assert_raises(RuntimeError) do
      @client.api_call('get', 'this_is_invalid_api_route')
    end

    # Assert GET call is properly triggered
    response = @client.api_call('get', 'configuration')
    assert_instance_of Tmdby::Response, response
    assert_equal "200", response.code
    assert_equal "GET", response.http_verb
    assert_equal @client.get_uri('configuration'), response.uri
    assert_includes response.headers, "content-length"
    assert_includes response.body, "images"
    assert_includes response.body, "change_keys"

    skip


  end

end
