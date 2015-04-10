module Tmdby
  class Discover < Wrapper

    @root = "discover"

    # Discover movies by different types of data like average rating, number of votes, genres and certifications.
    def self.movie(params = {})
      self.fetch "movie",
                  params,
                  authorized_params: [  "certification_country", "certification", "certification.lte", "include_adult", "include_video",
                                        "language", "page", "primary_release_year", "primary_release_date.gte", "primary_release_date.lte",
                                        "release_date.gte", "release_date.lte", "sort_by", "vote_count.gte", "vote_count.lte",
                                        "vote_average.gte", "vote_average.lte", "with_cast", "with_crew", "with_companies",
                                        "with_genres", "with_keywords", "with_people", "year"
                                      ]
    end

    # Discover TV shows by different types of data like average rating, number of votes, genres, the network they aired on and air dates.
    def self.tv(params = {})
      self.fetch "tv",
                  params,
                  authorized_params: [  "page", "language", "sort_by", "first_air_date_year", "vote_count.gte",
                                        "vote_average.gte", "with_genres", "with_networks", "first_air_date.gte", "first_air_date.lte"
                                      ]
    end
  end
end
