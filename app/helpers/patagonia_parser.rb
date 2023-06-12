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

    def parse_amenities
        amenities = @json['amenities']
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

    def parse_images
        images = @json['images']
        img_keys = images.keys
        formatted_images = {}
        img_keys.each do |k|
            formatted_images[k] = images[k].map do |url_des|
                {
                    link: url_des["url"],
                    description: url_des["description"]
                }
            end
        end
        @images = formatted_images.to_json
    end
end