require 'test_helper'

class CelebrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get celebrations_update_url
    assert_response :success
  end

end
