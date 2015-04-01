module Tmdby
    class Changes

        # Get a list of movie ids that have been edited
        def self.movie_changes(page = nil, start_date = nil, end_date = nil)
            Tmdby::Client.get "movie/changes", {:page => page, :start_date => start_date, :end_date => end_date}
        end

        # Get a list of people ids that have been edited
        def self.person_changes(page = nil, start_date = nil, end_date = nil)
            Tmdby::Client.get "person/changes", {:page => page, :start_date => start_date, :end_date => end_date}
        end

        # Get a list of TV show ids that have been edited
        def self.tv_changes(page = nil, start_date = nil, end_date = nil)
            Tmdby::Client.get "tv/changes", {:page => page, :start_date => start_date, :end_date => end_date}
        end
    end
end
