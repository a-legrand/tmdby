module Tmdby
  class Changes < Wrapper

    # Get a list of movie ids that have been edited
    def self.movie_changes(page = nil, start_date = nil, end_date = nil)
      self.fetch "movie/changes", {:page => page, :start_date => start_date, :end_date => end_date}
    end

    # Get a list of people ids that have been edited
    def self.person_changes(page = nil, start_date = nil, end_date = nil)
      self.fetch "person/changes", {:page => page, :start_date => start_date, :end_date => end_date}
    end

    # Get a list of TV show ids that have been edited
    def self.tv_changes(page = nil, start_date = nil, end_date = nil)
      self.fetch "tv/changes", {:page => page, :start_date => start_date, :end_date => end_date}
    end
  end
end
