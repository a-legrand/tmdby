require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestJobs < MinitestWrapper

  def setup
    init_setup
    @jobs = Tmdby::Jobs
  end

  def test_list
    multi_assert @jobs.list,
                    uri: "http://api.themoviedb.org/3/job/list?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "jobs"
  end

end
