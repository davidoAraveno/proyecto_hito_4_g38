require 'test_helper'

class InvitedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inviteds_index_url
    assert_response :success
  end

end
