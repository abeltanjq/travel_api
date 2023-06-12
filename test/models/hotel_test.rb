require "test_helper"

class HotelTest < ActiveSupport::TestCase
    test "that Hotel is valid" do
        hotel = Hotel.new(hotel_id: "123", destination_id: "321", name: "good hotel", description: "This is a very good hotel.")
        assert hotel.valid?
    end
end
