require 'test_helper'

class CeremoniesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get ceremonies_update_url
    assert_response :success
  end

end
