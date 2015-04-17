**work in progress**

TMDBY : a Ruby wrapper for the [TMDB API](http://docs.themoviedb.apiary.io/)
---------------

Features
--------

- Full integration of all the TMDB API


Installation
------------
_todo_

How to use
----------

Every API is encapsulated in its own ruby class. For example, the Movie API is in lib/wrappers/movie.rb

**Configuration**

Set your api key :

```ruby
Tmdby::Init.key = "your_api_key"
```

If you want, you can set a default language value :

```
Tmdby::Init.default_language = "fr"
```

**Example of use**

- Get Movie by id :

 ```ruby
 Tmdby::Movies.get 550
 ```
- Find by IMDB id :

 ```ruby
 Tmdby::Find.get "tt0266543", 'imdb_id', language:'es'
 ```

- Discover Movies by criterias :

 ```ruby
 Tmdby::Discover.movie year: 1994, with_cast: 1269
 ```

_todo_

Helpers
-------

_todo_

More to come
------------

- callback parameter support
- images helpers

_todo_
