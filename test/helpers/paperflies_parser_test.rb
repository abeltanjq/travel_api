require "test_helper"

class PaperfliesParserTest < ActiveSupport::TestCase
    def setup
        @json_data = File.read(Rails.root.join('test', 'fixtures/files/paperflies.json'))
        @data = ActiveSupport::JSON.decode(@json_data)
    end
  test "hotel id can be extracted from json" do
    @data.each do |hotel|
      pp = PaperfliesParser.new(hotel)
      assert_not_nil pp.address
      assert_equal pp.hotel_id, hotel['hotel_id']
    end
  end

  test "destination id can be extracted from json" do
    @data.each do |hotel|
      pp = PaperfliesParser.new(hotel)
      assert_not_nil pp.address
      assert_equal pp.destination_id, hotel['destination_id']
    end
  end

  test "hotel name can be extracted from json" do
    @data.each do |hotel|
      pp = PaperfliesParser.new(hotel)
      assert_not_nil pp.address
      assert_equal pp.name, hotel['hotel_name']
    end
  end

  test "address can be extracted from json" do
    @data.each do |hotel|
      pp = PaperfliesParser.new(hotel)
      assert_not_nil pp.address
      assert_equal pp.address, hotel['location']['address']
    end
  end

  test "country can be extracted from json" do
    @data.each do |hotel|
      pp = PaperfliesParser.new(hotel)
      assert_not_nil pp.country
      assert_equal pp.country, hotel['location']['country']
    end
  end

  test "details can be extracted from json" do
    @data.each do |hotel|
      pp = PaperfliesParser.new(hotel)
      assert_not_nil pp.description
      assert_equal pp.description, hotel['details']
    end
  end

  test "amenities can be extracted from json" do
    @data.each do |hotel|
      pp = PaperfliesParser.new(hotel)
      assert_equal pp.amenities, hotel['amenities'].to_json
    end
  end

  test "images formatted from json" do
    expected_format = {
      rooms: [
        {
          link: "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/2.jpg",
          description: "Double room"
        },
        {
          link: "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/3.jpg",
          description: "Double room"
        }
      ],
      site: [
        {
          link: "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/1.jpg",
          description: "Front"
        }
      ]
    }

    assert_equal expected_format.to_json, PaperfliesParser.new(@data[0]).images
  end

  test "booking_conditions can be extracted from json" do
    @data.each do |hotel|
      pp = PaperfliesParser.new(hotel)
      assert_not_nil pp.booking_conditions
      assert_equal pp.booking_conditions, hotel['booking_conditions'].to_json
    end
  end
end