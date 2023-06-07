class AcmeParser < HotelParser
    
    private
    def parse_hotel_id
        @hotel_id = @json['Id']
    end

    def parse_destination_id
        @destination_id = @json['DestinationId']
    end

    def parse_name
        @name = @json['Name']
    end

    def parse_lat
        @lat = @json['Latitude']
    end
end