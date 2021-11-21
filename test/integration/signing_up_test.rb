require "test_helper"

class SigningUpTest < ActionDispatch::IntegrationTest

  test "sign up a user" do
    get '/signup'
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "default", email: "default@test.com", password: "password" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "profile", response.body
  end

end
