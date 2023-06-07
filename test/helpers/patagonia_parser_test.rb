require "test_helper"
require "json"


class PatagoniaParserTest < ActiveSupport::TestCase
    def setup
        @json_data = File.read(Rails.root.join('test', 'fixtures/files/patagonia.json'))
        @data = JSON.parse(@json_data)
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
end