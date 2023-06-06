class PatagoniaParser < HotelParser
    
    private
    def parse_hotel_id
        @hotel_id = @json['id']
    end

    def parse_destination_id
        @destination_id = @json['destination']
    end

    def parse_name
        @name = @json['name']
    end
end