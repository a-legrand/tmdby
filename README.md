TMDBY : a Ruby wrapper for the [TMDB API](http://docs.themoviedb.apiary.io/)
---------------

[![Gem Version](https://badge.fury.io/rb/tmdby.svg)](https://badge.fury.io/rb/tmdby)

Features
--------

- Full integration of all the TMDB API


Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'tmdby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tmdby

How to use
----------

Every API is encapsulated in its own ruby class. For example, the Movie API is in lib/wrappers/movie.rb

**Configuration**

Set up your api key :

```ruby
Tmdby::Setup.key = "your_api_key"
```

By default, every call to TMDB Api is set in insecure mode (HTTP).
If you want to enable HTTPS :

```ruby
Tmdby::Setup.secure = true
```

If you want, you can set a default language value :

```ruby
Tmdby::Setup.default_language = "fr"
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

You can take a look in the _tests_ directory to view a lot of examples.


Helpers
-------

_todo_

Running tests
-------------

Just call rake with your credentials :

```
% TMDB_API_KEY=<your_tmdb_api_key> TMDB_USERNAME=<your_tmdb_username> TMDB_PASSWORD=<your_tmdb_password> rake

Run options: --seed 60805

# Running:

.......................................................S...................................................................S.

Finished in 53.308930s, 2.3448 runs/s, 16.0573 assertions/s.

125 runs, 856 assertions, 0 failures, 0 errors, 2 skips

You have skipped tests. Run with --verbose for details.
```

Changelog
---------

[TMDB API updates](https://www.themoviedb.org/documentation/api/updates)

- 2015-10-30 Up-to-date with "Jurassic World" TMDB API update


More to come
------------

- callback parameter support
- images helpers



Contributing
------------

1. Fork it ( https://github.com/a-legrand/tmdby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
