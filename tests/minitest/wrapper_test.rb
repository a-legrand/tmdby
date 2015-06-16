require 'minitest/autorun'
require 'tmdby'

class TestWrapper < Minitest::Test

  def setup
    Tmdby::Setup.key = nil
    Tmdby::Setup.default_language = nil

    @wrapper = Tmdby::Wrapper
    @wrapper.params = {}
    @wrapper.clean_params = {}
    @wrapper.post_params = {}
  end

  def test_route
    assert_equal "", @wrapper.route("")
    assert_equal "hello", @wrapper.route("hello")

    @wrapper.root = "root"

    assert_equal "root", @wrapper.route("")
    assert_equal "root/hello", @wrapper.route("hello")
  end

  def test_verify_params
    @wrapper.params = {'k1' => 'v1', 'k2' => 'v2'}

    @wrapper.verify_params(['k1', 'k2']) # this ensures that if no error is raised, the function works as expected. No need to use minitest assertions
    assert_raises(RuntimeError) { @wrapper.verify_params(['k2']) }
  end

  def test_add_default_language
    @wrapper.add_default_language
    assert_empty @wrapper.params # no language is expexted

    @wrapper.params = {'language' => 'fr'}
    @wrapper.add_default_language
    assert_equal({'language' => 'fr'}, @wrapper.params) # wrapper-level language value is expected

    @wrapper.params = {'language' => 'fr'}
    Tmdby::Setup.default_language = "en"
    @wrapper.add_default_language
    assert_equal({'language' => 'fr'}, @wrapper.params) # wrapper-level language value is expected

    @wrapper.params = {}
    @wrapper.add_default_language
    assert_equal({'language' => 'en'}, @wrapper.params) # client default-level language value is expected
  end

  def test_handle_post_params
    @wrapper.params = {k1:'v1', k2:'v2', k3:150, k4:'abc', k5:6, "k7" => 'hello'}

    @wrapper.handle_post_params ['k2', 'k3']

    assert_equal({'k1' => 'v1', 'k4' => 'abc', 'k5' => 6, 'k7' => 'hello'}, @wrapper.clean_params)
    assert_equal({'k2' =>'v2', 'k3' => 150}, @wrapper.post_params)
  end

  def test_fetch
    skip
  end

end
