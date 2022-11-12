require "test_helper"

class LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get labels_index_url
    assert_response :success
  end

  test "should get show" do
    get labels_show_url
    assert_response :success
  end
end
