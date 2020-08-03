require 'test_helper'

class WorkOrderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get work_order_index_url
    assert_response :success
  end

end
