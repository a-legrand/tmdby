require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestTimezones < MinitestWrapper

  def setup
    init_setup
    @timezones = Tmdby::Timezones
  end

  def test_list
    response = @timezones.list

    multi_assert response,
                    uri: "http://api.themoviedb.org/3/timezones/list?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body
  end

end
