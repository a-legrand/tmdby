require 'minitest/autorun'
require 'tmdby'

class MinitestWrapper < Minitest::Test

  def init_setup
    Tmdby::Setup.key = API_KEY
    Tmdby::Setup.default_language = nil
  end

  def multi_assert(result, params = {})
    uri = params[:uri] || throw('missing uri') # required
    http_verb = params[:http_verb] || throw('missing http_verb') # required
    code = params[:code] || throw('missing code') # required

    includes = params[:includes]
    status_code = params[:status_code]
    id = params[:id]
    empty = params[:empty]
    not_empty = params[:not_empty]
    not_nil = params[:not_nil]
    must_be_true = params[:must_be_true]
    must_be_false = params[:must_be_false]
    post_params = params[:post_params]

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
