require "test_helper"

# Each child parser is of a different name so that each test can run
# concurrently and independently. 
class HotelParserTest < ActiveSupport::TestCase

  test "that error is raised when parse_hotel_id is not implemented" do  
    class ChildAParser < HotelParser; end
    assert_raises(NotImplementedError, /parse_hotel_id/) { ChildAParser.new('') }
  end

  test "that error is raised when parse_destination_id is not implemented" do  
    class ChildBParser < HotelParser
      
      private
      def parse_hotel_id; 'dummy' end
    end

    assert_raises(NotImplementedError, /parse_destination_id/) { ChildBParser.new('') }
  end

  test "that error is raised when parse_name is not implemented" do  
    class ChildCParser < HotelParser
      
      private
      def parse_hotel_id; 'dummy' end
      def parse_destination_id; 'dummy' end
    end
    
    assert_raises(NotImplementedError, /parse_name/) { ChildCParser.new('') }
  end

  test "latitude and longitude are nil by default" do  
    class ChildDParser < HotelParser
      
      private
      def parse_hotel_id; 'dummy' end
      def parse_destination_id; 'dummy' end
      def parse_name; 'dummy' end
      def parse_address; 'dummy' end
    end

    assert_nil ChildDParser.new('').lat
    assert_nil ChildDParser.new('').lng
  end

  test "that error is raised when parse_address is not implemented" do  
    class ChildEParser < HotelParser
      
      private
      def parse_hotel_id; 'dummy' end
      def parse_destination_id; 'dummy' end
      def parse_name; 'dummy' end
    end

    assert_raises(NotImplementedError, /parse_address/) { ChildEParser.new('') }
  end
end