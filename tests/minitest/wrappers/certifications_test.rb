require_relative 'minitest_wrapper.rb'

class TestCertifications < MinitestWrapper

  def setup
    init_setup
    @certifications = Tmdby::Certifications
  end

  def test_movie_list
    multi_assert @certifications.movie_list,
                    uri: "http://api.themoviedb.org/3/certification/movie/list?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "certifications"
  end

  def test_tv_list
    multi_assert @certifications.tv_list,
                    uri: "http://api.themoviedb.org/3/certification/tv/list?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    includes: "certifications"
  end


end
