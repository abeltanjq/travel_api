require "test_helper"
require "json"


class AcmeParserTest < ActiveSupport::TestCase
    def setup
        @json_data = File.read(Rails.root.join('test', 'fixtures/files/acme.json'))
        @data = JSON.parse(@json_data)
    end
  test "hotel id can be extracted from json" do
    @data.each do |hotel|
      assert_equal AcmeParser.new(hotel).hotel_id, hotel['Id']
    end
  end

  test "destination id can be extracted from json" do
    @data.each do |hotel|
      assert_equal AcmeParser.new(hotel).destination_id, hotel['DestinationId']
    end
  end

  test "hotel name can be extracted from json" do
    @data.each do |hotel|
      assert_equal AcmeParser.new(hotel).name, hotel['Name']
    end
  end

  test "latitude can be extracted from json" do
    @data.each do |hotel|
      assert_equal AcmeParser.new(hotel).lat, hotel['Latitude']
    end
  end

  test "longitude can be extracted from json" do
    @data.each do |hotel|
      assert_equal AcmeParser.new(hotel).lng, hotel['Longitude']
    end
  end
end