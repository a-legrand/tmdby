module Tmdby
  class Search < Wrapper

    @root = "search"

    # Search for companies by name.
    def self.company(query, optional_params = {})
      self.fetch "company",
                  optional_params,
                  query: query,
                  authorized_params: ["query", "page"]
    end

    # Search for collections by name.
    def self.collection(query, optional_params = {})
      self.fetch "collection",
                  optional_params,
                  query: query,
                  authorized_params: ["query", "page", "language"]
    end

    # Search for keywords by name.
    def self.keyword(query, optional_params = {})
      self.fetch "keyword",
                  optional_params,
                  query: query,
                  authorized_params: ["query", "page"]
    end

    # Search for lists by name and description.
    def self.list(query, optional_params = {})
      self.fetch "list",
                  optional_params,
                  query: query,
                  authorized_params: ["query", "page", "include_adult"]
    end

    # Search for movies by title.
    def self.movie(query, optional_params = {})
      self.fetch "movie",
                  optional_params,
                  query: query,
                  authorized_params: ["query", "page", "language", "include_adult", "year", "primary_release_year", "search_type"]
    end

    # Search the movie, tv show and person collections with a single query.
    def self.multi(query, optional_params = {})
      self.fetch "multi",
                  optional_params,
                  query: query,
                  authorized_params: ["query", "page", "language", "include_adult"]
    end

    # Search for people by name.
    def self.person(query, optional_params = {})
      self.fetch "person",
                  optional_params,
                  query: query,
                  authorized_params: ["query", "page", "include_adult", "search_type"]
    end

    # Search for TV shows by title.
    def self.tv(query, optional_params = {})
      self.fetch "tv",
                  optional_params,
                  query: query,
                  authorized_params: ["query", "page", "language", "first_air_date_year", "search_type"]
    end

  end
end
