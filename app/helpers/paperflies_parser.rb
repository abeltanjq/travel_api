class PaperfliesParser < HotelParser
    
    private
    def parse_hotel_id
        @hotel_id = @json['hotel_id']
    end

    def parse_destination_id
        @destination_id = @json['destination_id']
    end

    def parse_name
        @name = @json['hotel_name']
    end
end