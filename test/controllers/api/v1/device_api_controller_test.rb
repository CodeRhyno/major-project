require 'test_helper'

class Api::V1::DeviceApiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_device_api_index_url
    assert_response :success
  end

end
