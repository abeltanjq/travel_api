require "test_helper"

class HotelSupplyTest < ActiveSupport::TestCase
    test "use amenities that are not nil" do
        amenities = {
            "general": [
                "indoor pool"
            ],
            "room": [
                "tv",
                "aircon"
            ]
        }.to_json

        hs = Fetchers::HotelSupply.new('')
        assert_not_nil hs.merge_amenities(nil, amenities)
        assert_not_nil hs.merge_amenities(amenities, nil)
    end

    test "duplicated amenities that are not added" do
        amenities = {
            "general": [
                "indoor pool"
            ],
            "room": [
                "tv",
                "aircon"
            ]
        }.to_json

        hs = Fetchers::HotelSupply.new('')
        merged_amen = hs.merge_amenities(amenities, amenities)
        decoded_merged_amen = ActiveSupport::JSON.decode(merged_amen)
        assert decoded_merged_amen["general"].length == 1
        assert decoded_merged_amen["room"].length == 2
    end

    test "pool is removed when there are outdoor or indoor pool" do
        amenities = {
            "general": [
                "indoor pool",
                "outdoor pool"
            ],
            "room": []
        }.to_json

        new_amenities = {
            "general": [
                "pool"
            ],
            "room": []
        }.to_json

        hs = Fetchers::HotelSupply.new('')
        merged_amen = hs.merge_amenities(amenities, new_amenities)
        decoded_merged_amen = ActiveSupport::JSON.decode(merged_amen)
        refute decoded_merged_amen["general"].include?("pool")
    end

    test "tub is removed when there is bathtub pool" do
        amenities = {
            "general": [],
            "room": ["bathtub"]
        }.to_json

        new_amenities = {
            "general": [],
            "room": ["tub"]
        }.to_json

        hs = Fetchers::HotelSupply.new('')
        merged_amen = hs.merge_amenities(amenities, new_amenities)
        decoded_merged_amen = ActiveSupport::JSON.decode(merged_amen)
        refute decoded_merged_amen["room"].include?("tub")
    end
    
    test "use images that are not nil" do
        images = {
            "rooms": [
                {
                "link": "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/2.jpg",
                "caption": "Double room"
                }
            ]
        }.to_json

        hs = Fetchers::HotelSupply.new('')
        assert_not_nil hs.merge_images(nil, images)
        assert_not_nil hs.merge_images(images, nil)
    end

    test "duplicate image links are removed" do
        images = {
            "rooms": [
                {
                "link": "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/2.jpg",
                "caption": "Double room"
                },
                {
                "link": "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/3.jpg",
                "caption": "Double room"
                }
            ]
        }.to_json

        hs = Fetchers::HotelSupply.new('')
        mi = hs.merge_images(images, images)
        decoded_mi = ActiveSupport::JSON.decode(mi)
        assert decoded_mi["rooms"].length == 2
    end

    test "unique image links are added" do
        images = {
            "rooms": [
                {
                "link": "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/2.jpg",
                "caption": "Double room"
                }
                
            ]
        }.to_json

        new_images = {
            "rooms": [
                {
                "link": "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/3.jpg",
                "caption": "Double room"
                }
            ]
        }.to_json

        hs = Fetchers::HotelSupply.new('')
        mi = hs.merge_images(images, new_images)
        decoded_mi = ActiveSupport::JSON.decode(mi)
        assert decoded_mi["rooms"].length == 2
    end

    test "new image links are added" do
        images = {
            "rooms": [
                {
                "link": "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/2.jpg",
                "caption": "Double room"
                },
                {
                "link": "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/3.jpg",
                "caption": "Double room"
                }
            ]
        }.to_json

        new_images = {
            "site": [
                {
                    "link": "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/1.jpg",
                    "caption": "Front"
                }
            ]
        }.to_json

        hs = Fetchers::HotelSupply.new('')
        mi = hs.merge_images(images, new_images)
        decoded_mi = ActiveSupport::JSON.decode(mi)

        assert decoded_mi["rooms"].length == 2
        assert decoded_mi["site"].length == 1
    end

    test "use booking conditions that are not nil" do
        booking_conditions = [
            "All children are welcome. One child under 6 years stays free of charge when using existing beds. There is no capacity for extra beds in the room.",
            "Pets are not allowed.",
        ].to_json

        hs = Fetchers::HotelSupply.new('')
        assert_not_nil hs.merge_booking_conditions(nil, booking_conditions)
        assert_not_nil hs.merge_amenities(booking_conditions, nil)
    end

    test "uniq booking conditions are merged" do
        booking_conditions = [
            "All children are welcome. One child under 6 years stays free of charge when using existing beds. There is no capacity for extra beds in the room."
        ].to_json

        new_booking_conditions = [
            "Pets are not allowed."
        ].to_json

        hs = Fetchers::HotelSupply.new('')
        mbc = hs.merge_booking_conditions(booking_conditions, new_booking_conditions)
        decoded_mbc = ActiveSupport::JSON.decode(mbc)
        assert decoded_mbc.length == 2
    end

    test "duplicate booking conditions are not merged" do
        booking_conditions = [
            "All children are welcome. One child under 6 years stays free of charge when using existing beds. There is no capacity for extra beds in the room."
        ].to_json

        hs = Fetchers::HotelSupply.new('')
        mbc = hs.merge_booking_conditions(booking_conditions, booking_conditions)
        decoded_mbc = ActiveSupport::JSON.decode(mbc)
        assert decoded_mbc.length == 1
    end
end