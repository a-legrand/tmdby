require_relative 'minitest_wrapper.rb'

class TestPeople < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil
    @people = Tmdby::People
  end

  def test_get
    response = @people.get 287

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/287?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 287, response.body["id"]
  end

  def test_movie_credits
    response = @people.movie_credits 287

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/287/movie_credits?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 287, response.body["id"]
    refute_empty response.body["cast"]
  end

  def test_tv_credits
    response = @people.tv_credits 287

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/287/tv_credits?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 287, response.body["id"]
    refute_empty response.body["cast"]
  end

  def test_combined_credits
    response = @people.combined_credits 287

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/287/combined_credits?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 287, response.body["id"]
    refute_empty response.body["cast"]
  end

  def test_external_ids
    response = @people.external_ids 287

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/287/external_ids?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 287, response.body["id"]
    assert_equal "nm0000093", response.body["imdb_id"]
  end

  def test_images
    response = @people.images 287

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/287/images?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 287, response.body["id"]
    refute_empty response.body["profiles"]
  end

  def test_tagged_images
    response = @people.tagged_images 287

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/287/tagged_images?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal 287, response.body["id"]
    refute_empty response.body["results"]
  end

  def test_changes
    response = @people.changes 287

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/287/changes?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_includes response.body, "changes"
  end

  def test_popular
    response = @people.popular

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/popular?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_empty response.body["results"]
  end

  def test_latest
    response = @people.latest

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/person/latest?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    refute_nil response.body["id"]
  end

end
