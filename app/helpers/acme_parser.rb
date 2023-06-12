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

    def parse_amenities
        amenities = @json['Facilities']
        return nil if amenities.nil?
        amenities_h = { general: [], room: [] }
        amenities.map! do |amenity|
            format_amenity(amenity)
        end
        
        amenities.each do |amenity|
            if Hotel::GENERAL_AMENITIES.include? amenity
                amenities_h[:general] << amenity
            elsif Hotel::ROOM_AMENITIES.include? amenity
                amenities_h[:room] << amenity
            end
        end

        @amenities = amenities_h.to_json
    end
end