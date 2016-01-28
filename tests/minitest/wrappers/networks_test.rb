require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestNetworks < MinitestWrapper

  def setup
    init_setup
    @networks = Tmdby::Networks
  end

  def test_get
    multi_assert @networks.get(1),
                    uri: "http://api.themoviedb.org/3/network/1?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 1
  end

end
