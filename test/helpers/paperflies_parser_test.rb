require "test_helper"
require "json"


class PaperfliesParserTest < ActiveSupport::TestCase
    def setup
        @json_data = File.read(Rails.root.join('test', 'fixtures/files/paperflies.json'))
        @data = JSON.parse(@json_data)
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
      assert_equal pp.amenities, hotel['amenities']
    end
  end
end