require_relative 'minitest_wrapper.rb'

class TestTvEpisodes < MinitestWrapper

  def setup
    # Tmdby::Init.key = API_KEY
    # Tmdby::Init.default_language = nil

    # @@session_id ||= Tmdby::Authentication.get_session_id 'tmdby_wrapper_test', 'CB4ZwmsIFtb7y4L8E0fv'
    # @account = Tmdby::Account
  end

  def test_get
    # assert_api_call @account.get(@@session_id),
    #                 uri: "http://api.themoviedb.org/3/account?session_id=#{@@session_id}&api_key=#{Tmdby::Init.key}",
    #                 http_verb: "GET",
    #                 code: "200"
  end

end
