require "test_helper"
require "json"


class PaperfliesParserTest < ActiveSupport::TestCase
    def setup
        @json_data = File.read(Rails.root.join('test', 'fixtures/files/paperflies.json'))
        @data = JSON.parse(@json_data)
    end
  test "hotel id can be extracted from json" do
    @data.each do |hotel|
      assert_equal PaperfliesParser.new(hotel).hotel_id, hotel['hotel_id']
    end
  end

  test "destination id can be extracted from json" do
    @data.each do |hotel|
      assert_equal PaperfliesParser.new(hotel).destination_id, hotel['destination_id']
    end
  end

  test "hotel name can be extracted from json" do
    @data.each do |hotel|
      assert_equal PaperfliesParser.new(hotel).name, hotel['hotel_name']
    end
  end

  test "address name can be extracted from json" do
    @data.each do |hotel|
      pp = PaperfliesParser.new(hotel)
      assert_not_nil pp.address
      assert_equal pp.address, hotel['location']['address']
    end
  end
end