module Tmdby
  class Account < Wrapper

    @root = "account"

    # Get the basic information for an account.
    def self.get(session_id)
      self.fetch "",
                  session_id: session_id,
                  authorized_params: ["session_id"]
    end

    # For all next apis, don't know why ID is require. It seems ignored by TMDB...

    # Get the lists that you have created and marked as a favorite.
    def self.lists(id, session_id, optional_params = {})
      self.fetch "#{id}/lists",
                  optional_params,
                  session_id: session_id,
                  authorized_params: ['session_id', 'page', 'language']
    end

    # Get the list of favorite movies for an account.
    def self.favorite_movies(id, session_id, optional_params = {})
      self.fetch "#{id}/favorite/movies",
                  optional_params,
                  session_id: session_id,
                  authorized_params: ['session_id', 'page', 'language', 'sort_by']
    end

    # Get the list of favorite TV series for an account.
    def self.favorite_tv(id, session_id, optional_params = {})
      self.fetch "#{id}/favorite/tv",
                  optional_params,
                  session_id: session_id,
                  authorized_params: ['session_id', 'page', 'language', 'sort_by']
    end

    # Add or remove a movie to an accounts favorite list.
    def self.favorite(id, session_id, media_type, media_id, favorite)
      self.fetch "#{id}/favorite",
                  method: 'post',
                  session_id: session_id,
                  media_type: media_type,
                  media_id: media_id,
                  favorite: favorite,
                  post_params: ["media_type", "media_id", "favorite"],
                  authorized_params: ['session_id', "media_type", "media_id", "favorite"]
    end

    # Get the list of rated movies (and associated rating) for an account.
    def self.rated_movies(id, session_id, optional_params = {})
      self.fetch "#{id}/rated/movies",
                  optional_params,
                  session_id: session_id,
                  authorized_params: ['session_id', 'page', 'language', 'sort_by']
    end

    # Get the list of rated TV shows (and associated rating) for an account.
    def self.rated_tv(id, session_id, optional_params = {})
      self.fetch "#{id}/rated/tv",
                  optional_params,
                  session_id: session_id,
                  authorized_params: ['session_id', 'page', 'language', 'sort_by']
    end

    # Get the list of rated tv episodes (and associated rating) for an account.
    def self.rated_tv_episodes(id, session_id, optional_params = {})
      self.fetch "#{id}/rated/tv/episodes",
                  optional_params,
                  session_id: session_id,
                  authorized_params: ['session_id', 'page', 'language', 'sort_by']
    end

    # Get the list of movies on an accounts watchlist.
    def self.watchlist_movies(id, session_id, optional_params = {})
      self.fetch "#{id}/watchlist/movies",
                  optional_params,
                  session_id: session_id,
                  authorized_params: ['session_id', 'page', 'language', 'sort_by']
    end

    # Get the list of TV series on an accounts watchlist.
    def self.watchlist_tv(id, session_id, optional_params = {})
      self.fetch "#{id}/watchlist/tv",
                  optional_params,
                  session_id: session_id,
                  authorized_params: ['session_id', 'page', 'language', 'sort_by']
    end

    # Add or remove a movie to an accounts watch list.
    def self.watchlist(id, session_id, media_type, media_id, watchlist)
      self.fetch "#{id}/watchlist",
                  method: 'post',
                  session_id: session_id,
                  media_type: media_type,
                  media_id: media_id,
                  watchlist: watchlist,
                  post_params: ["media_type", "media_id", "watchlist"],
                  authorized_params: ['session_id', "media_type", "media_id", "watchlist"]
    end


  end
end
