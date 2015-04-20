require 'minitest/autorun'
require 'lib/init'

class TestInit < Minitest::Test

  def setup
    @init = Tmdby::Init
    @init.key = nil
    @init.default_language = nil
  end

  def test_set_key
    @init.key = "this_is_a_key"
    assert_equal "this_is_a_key", @init.key
  end

  def test_set_default_language
    @init.default_language = "fr"
    assert_equal "fr", @init.default_language
  end

end
