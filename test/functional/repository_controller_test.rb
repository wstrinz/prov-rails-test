require 'test_helper'

class RepositoryControllerTest < ActionController::TestCase
  test "should get query" do
    get :query
    assert_response :success
  end

end
