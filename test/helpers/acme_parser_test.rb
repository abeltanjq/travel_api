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

  test "address can be extracted from json" do
    @data.each do |hotel|
      assert_equal AcmeParser.new(hotel).address, hotel['Address']
    end
  end

  test "city can be extracted from json" do
    @data.each do |hotel|
      assert_equal AcmeParser.new(hotel).city, hotel['City']
    end
  end

  test "country can be extracted from json" do
    @data.each do |hotel|
      assert_equal AcmeParser.new(hotel).country, hotel['Country']
    end
  end

  test "postal code can be extracted from json" do
    @data.each do |hotel|
      assert_equal AcmeParser.new(hotel).postal_code, hotel['PostalCode']
    end
  end

  test "description can be extracted from json" do
    @data.each do |hotel|
      assert_equal AcmeParser.new(hotel).description, hotel['Description']
    end
  end
end