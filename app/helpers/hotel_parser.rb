class HotelParser
    def initialize (json)
        @json = json
        parse_hotel
    end

    attr_reader :hotel_id, :destination_id, :name, :lat, :lng

    private

    def parse_hotel
        parse_hotel_id
        parse_destination_id
        parse_name
        parse_lat
        parse_lng
    end

    def parse_hotel_id
        raise NotImplementedError, 'Subclass must implement parse_hotel_id.'
    end

    def parse_destination_id
        raise NotImplementedError, 'Subclass must implement parse_destination_id.'
    end

    def parse_name
        raise NotImplementedError, 'Subclass must implement parse_name.' 
    end

    def parse_lat
        @lat = nil 
    end

    def parse_lng
        @lng = nil 
    end
end