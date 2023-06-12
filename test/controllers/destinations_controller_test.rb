require "test_helper"

class DestinationsControllerTest < ActionDispatch::IntegrationTest
  test "that /destinations/5432 is successful" do
    destinations = get "/destinations/5432"
    assert_response :success
  end

end
