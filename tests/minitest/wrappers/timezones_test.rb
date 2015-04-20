require_relative 'minitest_wrapper.rb'

class TestTimezones < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @timezones = Tmdby::Timezones
  end

  def test_list
    response = @timezones.list

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/timezones/list?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body
  end

end
