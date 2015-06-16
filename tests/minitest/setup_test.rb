require 'minitest/autorun'
require 'tmdby'

class TestSetup < Minitest::Test

  def setup
    @setup = Tmdby::Setup
    @setup.key = nil
    @setup.default_language = nil
    @setup.secure = false
  end

  def teardown
    @setup.secure = false
  end

  def test_set_key
    @setup.key = "this_is_a_key"
    assert_equal "this_is_a_key", @setup.key
  end

  def test_set_default_language
    @setup.default_language = "fr"
    assert_equal "fr", @setup.default_language
  end

  def test_secure
    assert_equal "http", @setup.api_scheme

    @setup.secure = true
    assert_equal "https", @setup.api_scheme
  end


end
