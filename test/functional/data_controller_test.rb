require 'test_helper'

class DataControllerTest < ActionController::TestCase
  test "should get dataset" do
    get :dataset
    assert_response :success
  end

  test "should get metadata" do
    get :metadata
    assert_response :success
  end

end
