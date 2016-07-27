require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  # test khi thong tin dang nhap khong phu hop
  test "invalid signup information " do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {name: "", email: "user@invalid", password: "foo", password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  # test khi thong tin dang nhap phu hop
  test " valid signup information " do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Example User", email: "user@example.com", password: "oanh123", password_confirmation: "oanh123"}}
    end
    follow_redirect! # dieu huong chinh xac den trang muc tieu
    assert_template 'users/show'
  end
end
