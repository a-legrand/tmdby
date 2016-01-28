require File.join(File.dirname(__FILE__), 'minitest_wrapper.rb')

class TestLists < MinitestWrapper

  def setup
    init_setup
    @@session_id ||= Tmdby::Authentication.get_session_id USERNAME, PASSWORD
    @lists = Tmdby::Lists
  end

  # This function creates a new List and returns its ID
  def get_id_new_list
    (@lists.new @@session_id, Time.new.strftime("Test-%Y-%m-%d-%H:%M:%S-#{Random.new.rand}"), 'description').body["list_id"]
  end

  def delete_list(id)
    @lists.delete id, @@session_id
  end

  def test_get
    list_id = get_id_new_list

    multi_assert @lists.get(list_id),
                    uri: "http://api.themoviedb.org/3/list/#{list_id}?api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: list_id

    delete_list list_id
  end

  def test_delete
    list_id = get_id_new_list

    multi_assert @lists.delete(list_id, @@session_id),
                    uri: "http://api.themoviedb.org/3/list/#{list_id}?session_id=#{@@session_id}&api_key=#{API_KEY}",
                    http_verb: "DELETE",
                    code: "200",
                    status_code: 13
  end

  def test_item_status
    list_id = get_id_new_list

    # We add Movie#550 in the list
    @lists.add_item list_id, @@session_id, 550
    sleep 5

    # We verify Movie#550 is in the list
    multi_assert @lists.item_status(list_id, 550),
                    uri: "http://api.themoviedb.org/3/list/#{list_id}/item_status?movie_id=550&api_key=#{API_KEY}",
                    http_verb: "GET",
                    code: "200",
                    id: list_id,
                    must_be_true: "item_present"

    delete_list list_id
  end

  def test_list
    list_name = Time.new.strftime("Test-%Y-%m-%d-%H:%M:%S-#{Random.new.rand}")

    response = @lists.new @@session_id, list_name, 'new description'

    multi_assert response,
                    uri: "http://api.themoviedb.org/3/list?session_id=#{@@session_id}&api_key=#{API_KEY}",
                    http_verb: "POST",
                    post_params: {"name" => list_name, "description" => "new description"},
                    code: "201",
                    status_code: 1,
                    includes: "list_id"

    delete_list response.body["list_id"]
  end

  def test_add_item
    list_id = get_id_new_list

    response = @lists.add_item list_id, @@session_id, 550

    multi_assert response,
                    uri: "http://api.themoviedb.org/3/list/#{list_id}/add_item?session_id=#{@@session_id}&api_key=#{API_KEY}",
                    http_verb: "POST",
                    post_params: {"media_id" => 550},
                    code: "201",
                    status_code: 12

    delete_list list_id
  end

  def test_remove_item
    list_id = get_id_new_list

    @lists.add_item list_id, @@session_id, 550

    sleep 5

    response = @lists.remove_item list_id, @@session_id, 550

    multi_assert response,
                    uri: "http://api.themoviedb.org/3/list/#{list_id}/remove_item?session_id=#{@@session_id}&api_key=#{API_KEY}",
                    http_verb: "POST",
                    post_params: {"media_id" => 550},
                    code: "200",
                    status_code: 13

    delete_list list_id
  end

  def test_clear
    list_id = get_id_new_list

    response = (@lists.clear list_id, @@session_id, true)

    multi_assert response,
                    uri: "http://api.themoviedb.org/3/list/#{list_id}/clear?session_id=#{@@session_id}&confirm=true&api_key=#{API_KEY}",
                    http_verb: "POST",
                    code: "201",
                    status_code: 12

    delete_list list_id
  end

end
