module Tmdby
  class Find

    # The find method makes it easy to search for objects in our database by an external id
    #
    # The supported external sources for each object are as follows:
    #     Movies: imdb_id
    #     People: imdb_id, freebase_mid, freebase_id, tvrage_id
    #     TVSeries: imdb_id, freebase_mid, freebase_id, tvdb_id, tvrage_id
    #     TVSeasons: freebase_mid, freebase_id, tvdb_id, tvrage_id
    #     TVEpisodes: imdb_id, freebase_mid, freebase_id, tvdb_id, tvrage_id
    def self.get(id, external_source, language = nil)
      Tmdby::Client.get "find/#{id}", {:external_source => external_source, :language => language}
    end
  end
end
