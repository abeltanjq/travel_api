require "test_helper"

class HotelsControllerTest < ActionDispatch::IntegrationTest
  test "that /hotels?ids[]=123&ids[]=456 is successful" do
    destinations = get "/hotels?ids[]=123&ids[]=456"
    assert_response :success
  end
end
