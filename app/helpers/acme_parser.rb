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

    def parse_lng
        @lng = @json['Longitude']
    end

    def parse_address
        @address = @json['Address']
    end

    def parse_city
        @city = @json['City']
    end

    def parse_country
        @country = @json['Country']
    end

    def parse_postal_code
        @postal_code = @json['PostalCode']
    end

    def parse_description
        @description = @json['Description']
    end
end