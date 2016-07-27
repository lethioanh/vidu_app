require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    # get static_pages_home_ur chuyen thanh
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}" # chấp nhận title "..." xuất hiện trong page home
  end

  test "should get help" do
    # get static_pages_help_url chuyen thanh
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}" # chấp nhận title "..." xuất hiện trong page help
  end

  test "should get about" do
    # get static_pages_about_url chuyen thanh
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}" # chấp nhận title "..." xuất hiện trong page about
  end
end
