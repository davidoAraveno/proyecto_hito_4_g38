require 'test_helper'

class ReservationItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get pay_with_paypal" do
    get reservation_items_pay_with_paypal_url
    assert_response :success
  end

end
