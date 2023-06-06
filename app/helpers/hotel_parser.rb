class HotelParser
    def initialize (json)
        @json = json
        parse_hotel
    end

    attr_reader :hotel_id, :destination_id, :name

    private

    def parse_hotel
        parse_hotel_id
        parse_destination_id
        parse_name
    end

    def parse_hotel_id
        raise NotImplementedError, 'Subclass must implement this method.'
    end

    def parse_destination_id
        raise NotImplementedError, 'Subclass must implement this method.'
    end

    def parse_name
        raise NotImplementedError, 'Subclass must implement this method.' 
    end
end