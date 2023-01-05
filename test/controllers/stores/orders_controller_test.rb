require "test_helper"

class Stores::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stores_orders_index_url
    assert_response :success
  end
end
