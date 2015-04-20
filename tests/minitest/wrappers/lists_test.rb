require_relative 'minitest_wrapper.rb'

class TestLists < MinitestWrapper

  def setup
    Tmdby::Init.key = API_KEY
    Tmdby::Init.default_language = nil

    @@session_id ||= Tmdby::Authentication.get_session_id 'tmdby_wrapper_test', 'CB4ZwmsIFtb7y4L8E0fv'
    @lists = Tmdby::Lists
  end

  # This function creates a new List and returns its ID
  def get_id_new_list
    (@lists.new @@session_id, Time.new.strftime("Test-%Y-%m-%d-%H:%M:%S-#{Random.new.rand}"), 'description').body["list_id"]
  end

  def delete_list(id)
    #TODOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOo
    #@lists.delete id
  end

  def test_get
    list_id = get_id_new_list

    response = @lists.get list_id

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/list/#{list_id}?api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal list_id, response.body["id"]

    delete_list list_id
  end

  def test_item_status
    list_id = get_id_new_list

    # We add Movie#550 in the list
    @lists.add_item list_id, @@session_id, 550
    sleep 5

    # We verify Movie#550 is in the list
    response = @lists.item_status list_id, 550

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/list/#{list_id}/item_status?movie_id=550&api_key=#{Tmdby::Init.key}",
                    http_verb: "GET",
                    code: "200"

    assert_equal list_id, response.body["id"]
    assert response.body["item_present"]

    delete_list list_id
  end

  def test_list
    response = @lists.new @@session_id, Time.new.strftime("Test-%Y-%m-%d-%H:%M:%S-#{Random.new.rand}"), 'description'

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/list?session_id=#{@@session_id}&api_key=#{Tmdby::Init.key}",
                    http_verb: "POST",
                    code: "201"
                    #todo : test POST PARAMETER

    assert_equal 1, response.body["status_code"]
    assert_includes response.body, "list_id"

    delete_list response.body["id"]
  end

  def test_add_item
    list_id = get_id_new_list

    response = @lists.add_item list_id, @@session_id, 550

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/list/#{list_id}/add_item?session_id=#{@@session_id}&api_key=#{Tmdby::Init.key}",
                    http_verb: "POST",
                    code: "201"
                    #todo : test POST PARAMETER

    assert_equal 12, response.body["status_code"]

    delete_list list_id
  end

  def test_remove_item
    list_id = get_id_new_list

    @lists.add_item list_id, @@session_id, 550

    sleep 5

    response = @lists.remove_item list_id, @@session_id, 550

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/list/#{list_id}/remove_item?session_id=#{@@session_id}&api_key=#{Tmdby::Init.key}",
                    http_verb: "POST",
                    code: "200"
                    #todo : test POST PARAMETER

    assert_equal 13, response.body["status_code"]

    delete_list list_id
  end

  def test_clear
    list_id = get_id_new_list

    response = (@lists.clear list_id, @@session_id, true)

    assert_api_call response,
                    uri: "http://api.themoviedb.org/3/list/#{list_id}/clear?session_id=#{@@session_id}&confirm=true&api_key=#{Tmdby::Init.key}",
                    http_verb: "POST",
                    code: "201"

    assert_equal 12, response.body["status_code"]

    delete_list list_id
  end

end
