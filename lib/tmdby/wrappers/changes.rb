module Tmdby
  class Changes < Wrapper

    # Get a list of movie ids that have been edited
    # Authorized params : page | start_date | end_date
    # Example : Tmdby::Changes.movie_changes page:2
    def self.movie(optional_params = {})
      self.fetch "movie/changes",
                  optional_params,
                  authorized_params: ['page', 'start_date', 'end_date']
    end

    # Get a list of people ids that have been edited
    # Authorized params : page | start_date | end_date
    # Example : Tmdby::Changes.person_changes page:2
    def self.person(optional_params = {})
      self.fetch "person/changes",
                  optional_params,
                  authorized_params: ['page', 'start_date', 'end_date']
    end

    # Get a list of TV show ids that have been edited
    # Authorized params : page | start_date | end_date
    # Example : Tmdby::Changes.tv_changes page:2
    def self.tv(optional_params = {})
      self.fetch "tv/changes",
                  optional_params,
                  authorized_params: ['page', 'start_date', 'end_date']
    end
  end
end
