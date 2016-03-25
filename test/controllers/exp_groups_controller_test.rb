require 'test_helper'

class ExpTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
