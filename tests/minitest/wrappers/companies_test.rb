require_relative 'minitest_wrapper.rb'

class TestCompanies < MinitestWrapper

  def setup
    init_setup
    @companies = Tmdby::Companies
  end

  def test_get
    response = @companies.get 1

    multi_assert response,
                    uri: "http://api.themoviedb.org/3/company/1?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 1

    assert_equal "Lucasfilm", response.body["name"]
  end

  def test_movies
    multi_assert @companies.movies(1),
                    uri: "http://api.themoviedb.org/3/company/1/movies?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 1,
                    not_empty: "results"
  end


end
