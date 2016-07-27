require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # Set up a user
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foorbar", password_confirmation: "foorbar")
  end
   # Test a user valid
  test "should be valid" do
    assert @user.valid?
  end

  # test user's name present
  test "name should be present " do
    @user.name = "   "
    assert_not @user.valid? # Tests if
  end
  # test user's email present
  test " email should be present " do
    @user.email = " "
    assert_not @user.valid?
  end
  #test user's name long
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  #test user's mail long
  test "email should not be too long" do
    @user.email = "a" * 244 + '@example.com'
    assert_not @user.valid?
  end
# test user's password present and minimum = 6
test " password should be present and minimum is 6" do
  @user.password = @user.password_confirmation = " " * 6
  assert_not @user.valid?
end
  # test email validation
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |va_ad|
      @user.email = va_ad
      assert @user.valid?, "#{va_ad.inspect} should be valid"
    end
  end

  # test user's email invalid
  test " email validation should reject invalid addresses " do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |inva_ad|
      @user.email = inva_ad
      assert_not @user.valid?, "#{inva_ad.inspect} should be invalid "
    end
  end

  # test user's email unique
  test " email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  #test user's email saved as lower-case
  test "email addresses should be saved as lower-case " do
    mixed_case_email = "Foo@EXAMPle.COM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
