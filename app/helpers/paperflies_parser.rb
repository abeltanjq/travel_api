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

    def parse_address
        @address = @json['location']['address']
    end

    def parse_country
        @country = @json['location']['country']
    end

    def parse_description
        @description = @json['details']
    end

    def parse_amenities
        @amenities = @json['amenities'].to_json
    end

    def parse_images
        images = @json['images']
        img_keys = images.keys
        formatted_images = {}
        img_keys.each do |k|
            formatted_images[k] = images[k].map do |link_cap|
                {
                    link: link_cap["link"],
                    description: link_cap["caption"]
                }
            end
        end
        @images = formatted_images.to_json
    end

    def parse_booking_conditions
        @booking_conditions = @json['booking_conditions'].to_json
    end
end