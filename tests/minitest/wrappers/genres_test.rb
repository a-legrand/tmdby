require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestGenres < MinitestWrapper

  def setup
    init_setup
    @genres = Tmdby::Genres
  end

  def test_movie_list
    multi_assert @genres.movie_list,
                    uri: "http://api.themoviedb.org/3/genre/movie/list?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "genres"
  end

  def test_tv_list
    multi_assert @genres.tv_list,
                    uri: "http://api.themoviedb.org/3/genre/tv/list?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "genres"
  end

  def test_movies
    multi_assert @genres.movies(35),
                    uri: "http://api.themoviedb.org/3/genre/35/movies?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 35,
                    not_empty: "results"
  end

end
