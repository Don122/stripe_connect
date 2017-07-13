require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { currency: @user.currency, default: @user.default, email: @user.email, name: @user.name, password_digest: @user.password_digest, publishable_key: @user.publishable_key, secret_key: @user.secret_key, stripe_account_status: @user.stripe_account_status, stripe_account_type: @user.stripe_account_type, stripe_user_id: @user.stripe_user_id, {}: @user.{} } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { currency: @user.currency, default: @user.default, email: @user.email, name: @user.name, password_digest: @user.password_digest, publishable_key: @user.publishable_key, secret_key: @user.secret_key, stripe_account_status: @user.stripe_account_status, stripe_account_type: @user.stripe_account_type, stripe_user_id: @user.stripe_user_id, {}: @user.{} } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
