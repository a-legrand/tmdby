module Tmdby
  class Certifications < Wrapper
    @root = 'certification'

    # Get the list of supported certifications for movies
    def self.movie_list
      self.fetch "movie/list"
    end

    # Get the list of supported certifications for tv shows
    def self.tv_list
      self.fetch "tv/list"
    end
  end
end
