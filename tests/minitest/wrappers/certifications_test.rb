require_relative 'minitest_wrapper.rb'

class TestCertifications < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil

    @certifications = Tmdby::Certifications
  end

  def test_movie_list
    response = @certifications.movie_list

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/certification/movie/list?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_includes response.body, "certifications"
    assert_includes response.body["certifications"], "US"
  end

  def test_tv_list
    response = @certifications.tv_list

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/certification/tv/list?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_includes response.body, "certifications"
    assert_includes response.body["certifications"], "US"
  end


end
