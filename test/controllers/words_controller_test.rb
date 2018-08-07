require 'test_helper'

class WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get enter" do
    get words_enter_url
    assert_response :success
  end

  test "should get score" do
    get words_score_url
    assert_response :success
  end

end
