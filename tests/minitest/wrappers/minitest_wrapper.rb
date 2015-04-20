require 'minitest/autorun'
require 'lib/init'

class MinitestWrapper < Minitest::Test

  def assert_api_call(result, uri:, http_verb:, code:)
    assert_equal uri, result.uri.to_s
    assert_equal http_verb, result.http_verb
    assert_equal code, result.code
    refute_empty result.body
  end

end
