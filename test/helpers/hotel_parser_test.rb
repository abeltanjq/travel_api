require "test_helper"

class HotelParserTest < ActiveSupport::TestCase

  test "that error is raised when parse_hotel_id is not implemented" do  
    class ChildParser < HotelParser; end
    assert_raises(NotImplementedError) { ChildParser.new('') }
  end

  test "that error is raised when parse_destination_id is not implemented" do  
    class ChildParser < HotelParser
      private
      def parse_hotel_id
        'dummy'
      end
    end

    assert_raises(NotImplementedError) { ChildParser.new('') }
  end

  test "that error is raised when parse_name is not implemented" do  
    class ChildParser < HotelParser
      private
      def parse_hotel_id
        'dummy'
      end

      def parse_destination_id
        'dummy'
      end
    end

    assert_raises(NotImplementedError) { ChildParser.new('') }
  end
end