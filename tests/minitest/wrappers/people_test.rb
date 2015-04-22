require_relative 'minitest_wrapper.rb'

class TestPeople < MinitestWrapper

  def setup
    init_setup
    @people = Tmdby::People
  end

  def test_get
    multi_assert @people.get(287),
                    uri: "http://api.themoviedb.org/3/person/287?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 287
  end

  def test_movie_credits
    multi_assert @people.movie_credits(287),
                    uri: "http://api.themoviedb.org/3/person/287/movie_credits?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 287,
                    not_empty: "cast"
  end

  def test_tv_credits
    multi_assert @people.tv_credits(287),
                    uri: "http://api.themoviedb.org/3/person/287/tv_credits?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 287,
                    not_empty: "cast"
  end

  def test_combined_credits
    multi_assert @people.combined_credits(287),
                    uri: "http://api.themoviedb.org/3/person/287/combined_credits?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 287,
                    not_empty: "cast"
  end

  def test_external_ids
    response = @people.external_ids 287

    multi_assert response,
                    uri: "http://api.themoviedb.org/3/person/287/external_ids?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 287

    assert_equal "nm0000093", response.body["imdb_id"]
  end

  def test_images
    multi_assert @people.images(287),
                    uri: "http://api.themoviedb.org/3/person/287/images?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 287,
                    not_empty: "profiles"
  end

  def test_tagged_images
    multi_assert @people.tagged_images(287),
                    uri: "http://api.themoviedb.org/3/person/287/tagged_images?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: 287,
                    not_empty: "results"
  end

  def test_changes
    multi_assert @people.changes(287),
                    uri: "http://api.themoviedb.org/3/person/287/changes?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "changes"
  end

  def test_popular
    multi_assert @people.popular,
                    uri: "http://api.themoviedb.org/3/person/popular?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_empty: "results"
  end

  def test_latest
    multi_assert @people.latest,
                    uri: "http://api.themoviedb.org/3/person/latest?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    not_nil: "id"
  end

end
