require_relative 'minitest_wrapper.rb'

class TestJobs < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @jobs = Tmdby::Jobs
  end

  def test_list
    response = @jobs.list

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/job/list?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["jobs"]
  end

end
