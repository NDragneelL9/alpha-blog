require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = User.create(username: "johndoe", email: "johndoe@example.com", password: "password", admin: false)
    sign_in_as(@user)
    @category1 = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
  end
  
  test "get new article and create article" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "New article", description: "Max length should be more", category_ids: [1, 2] } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Created", response.body
  end

end
