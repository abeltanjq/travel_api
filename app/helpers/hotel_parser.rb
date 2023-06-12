class HotelParser
    def initialize (json)
        @json = json
        parse_hotel
    end

    attr_reader :hotel_id, :destination_id, :name, :lat, :lng, :address, :city,
                :country, :postal_code, :description, :amenities, :images, :booking_conditions

    private

    def parse_hotel
        parse_hotel_id
        parse_destination_id
        parse_name
        parse_lat
        parse_lng
        parse_address
        parse_city
        parse_country
        parse_postal_code
        parse_description
        parse_amenities
        parse_images
        parse_booking_conditions
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

    def parse_address
        raise NotImplementedError, 'Subclass must implement parse_address.' 
    end

    def parse_city
        @city = nil
    end

    def parse_country
        @country = nil
    end

    def parse_postal_code
        @postal_code = nil
    end

    def parse_description
        raise NotImplementedError, 'Subclass must implement parse_description.' 
    end

    def parse_amenities
        raise NotImplementedError, 'Subclass must implement parse_amenities.' 
    end

    def parse_images
        @images = nil
    end

    def parse_booking_conditions
        @booking_conditions = nil
    end

    protected
    def format_amenity(amenity)
        # add a space between a lowercase and uppercase. eg. 'aB' -> 'a B'
        amty = amenity.strip.gsub(/(?<=[a-z])(?=[A-Z])/, ' ')
        amty.downcase!
        amty == 'wi fi' ? 'wifi' : amty
    end
end