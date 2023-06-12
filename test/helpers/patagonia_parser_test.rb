require "test_helper"

class PatagoniaParserTest < ActiveSupport::TestCase
    def setup
        @json_data = File.read(Rails.root.join('test', 'fixtures/files/patagonia.json'))
        @data = ActiveSupport::JSON.decode(@json_data)
    end
  test "hotel id can be extracted from json" do
    @data.each do |hotel|
      assert_equal PatagoniaParser.new(hotel).hotel_id, hotel['id']
    end
  end

  test "destination id can be extracted from json" do
    @data.each do |hotel|
      assert_equal PatagoniaParser.new(hotel).destination_id, hotel['destination']
    end
  end

  test "name can be extracted from json" do
    @data.each do |hotel|
      assert_equal PatagoniaParser.new(hotel).name, hotel['name']
    end
  end

  test "latitude can be extracted from json" do
    @data.each do |hotel|
      assert_equal PatagoniaParser.new(hotel).lat, hotel['lat']
    end
  end

  test "longitude can be extracted from json" do
    @data.each do |hotel|
      assert_equal PatagoniaParser.new(hotel).lng, hotel['lng']
    end
  end

  test "address can be extracted from json" do
    @data.each do |hotel|
      assert_equal PatagoniaParser.new(hotel).address, hotel['address']
    end
  end

  test "info can be extracted from json" do
    @data.each do |hotel|
      assert_equal PatagoniaParser.new(hotel).description, hotel['info']
    end
  end

  test "that amenities are formatted from json" do
    expected_amenities = {
      general: [],
      room: ["aircon", "tv", "coffee machine", "kettle", "hair dryer", "iron", "tub"]
    }
    assert_equal expected_amenities.to_json, PatagoniaParser.new(@data[0]).amenities
  end

  test "images formatted from json" do
    expected_format = {
      rooms: [
          {
            link: "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/2.jpg",
            description: "Double room"
          },
          {
            link: "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/4.jpg",
            description: "Bathroom"
          }
        ],
        amenities: [
          {
            link: "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/0.jpg",
            description: "RWS"
          },
          {
            link: "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/6.jpg",
            description: "Sentosa Gateway"
          }
        ]
    }

    assert_equal expected_format.to_json, PatagoniaParser.new(@data[0]).images
  end
end