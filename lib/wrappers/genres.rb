module Tmdby
  class Genres < Wrapper

    @root = "genre"

    # Get the list of movie genres.
    def self.movie_list(optional_params = {})
      self.fetch 'movie/list',
                  optional_params,
                  authorized_params: ["language"]
    end

    # Get the list of TV genres.
    def self.tv_list(optional_params = {})
      self.fetch 'tv/list',
                  optional_params,
                  authorized_params: ["language"]
    end

    # Get the list of movies for a particular genre by id. By default, only movies with 10 or more votes are included.
    def self.movies(id, optional_params = {})
      self.fetch "#{id}/movies",
                  optional_params,
                  authorized_params: ["page", "language", "include_all_movies", "include_adult"]
    end
  end
end
