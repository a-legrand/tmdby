require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestCollections < MinitestWrapper

  def setup
    init_setup
    @collections = Tmdby::Collections
  end

  def test_get
    multi_assert @collections.get(10),
                    uri: "http://api.themoviedb.org/3/collection/10?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 10,
                    not_empty: "parts"
  end

  def test_images
    multi_assert @collections.images(10),
                    uri: "http://api.themoviedb.org/3/collection/10/images?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 10,
                    not_empty: "backdrops"
  end


end
