require_relative 'minitest_wrapper.rb'

class TestGenres < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @genres = Tmdby::Genres
  end

  def test_movie_list
    response = @genres.movie_list

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/genre/movie/list?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["genres"]
  end

  def test_tv_list
    response = @genres.tv_list

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/genre/tv/list?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["genres"]
  end

  def test_movies
    response = @genres.movies 35

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/genre/35/movies?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 35, response.body["id"]
    refute_empty response.body["results"]
  end

end
