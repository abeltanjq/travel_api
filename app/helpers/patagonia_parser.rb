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

    def parse_lat
        @lat = @json['lat']
    end

    def parse_lng
        @lng = @json['lng']
    end

    def parse_address
        @address = @json['address']
    end

    def parse_description
        @description = @json['info']
    end
end