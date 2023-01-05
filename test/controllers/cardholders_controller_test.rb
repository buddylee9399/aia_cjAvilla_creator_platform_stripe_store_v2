require "test_helper"

class CardholdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cardholders_index_url
    assert_response :success
  end

  test "should get new" do
    get cardholders_new_url
    assert_response :success
  end
end
