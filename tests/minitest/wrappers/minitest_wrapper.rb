require 'minitest/autorun'
require 'tmdby'

class MinitestWrapper < Minitest::Test

  def init_setup
    Tmdby::Setup.key = API_KEY
    Tmdby::Setup.default_language = nil
  end

  def multi_assert(result,
                   uri:,
                   http_verb:,
                   code:,
                   includes: nil,
                   status_code: nil,
                   id: nil,
                   empty: nil,
                   not_empty: nil,
                   not_nil: nil,
                   must_be_true: nil,
                   must_be_false: nil,
                   post_params: nil
                  )
    assert_equal uri, result.uri.to_s
    assert_equal http_verb, result.http_verb
    assert_equal code, result.code
    refute_empty result.body
    assert_includes result.body, includes if includes
    assert_equal id, result.body["id"] if id
    assert_equal status_code, result.body["status_code"] if status_code
    assert_empty result.body[empty] if empty
    refute_empty result.body[not_empty] if not_empty
    refute_nil result.body[not_nil] if not_nil
    assert result.body[must_be_true] if must_be_true
    refute result.body[must_be_false] if must_be_false
    assert_equal result.post_params, post_params if post_params
  end

end
