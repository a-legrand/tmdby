module Tmdby
  class Certifications

    # Get the list of supported certifications for movies
    def self.movie_list
      Tmdby::Client.get "certification/movie/list"
    end

    # Get the list of supported certifications for tv shows
    def self.tv_list
      Tmdby::Client.get "certification/tv/list"
    end
  end
end
