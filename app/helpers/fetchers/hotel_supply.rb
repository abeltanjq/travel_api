module Fetchers
    class HotelSupply
        def initialize(url)
            @url = url
        end

        def parse_hotel(hotel)
            raise NotImplementedError, 'Subclass must implement parse_hotel.'
        end
        
        def load_hotels
            fetch
            @hotels.each do |hotel|
                hotel_parsed = parse_hotel(hotel)
                if Hotel.exists?(hotel_id: hotel_parsed.hotel_id)
                    update_hotel(hotel_parsed)
                else
                    create_hotel(hotel_parsed)
                end
            end
        end

        def merge_column(curr_val, value)
            return curr_val if value.nil?
            return value  if curr_val.nil?
            if curr_val.is_a?(String)
                return value if value.size > curr_val.size
            end
        end

        def merge_amenities(curr_amenities, value)
            return curr_amenities if value.nil?
            return value if curr_amenities.nil?

            curr_amen = ActiveSupport::JSON.decode(curr_amenities)
            new_amen = ActiveSupport::JSON.decode(value)
            general = curr_amen["general"].concat(new_amen["general"]).uniq
            pools = ['outdoor pool', 'indoor pool']
            general.delete('pool') unless (pools & general).empty?
            
            room = curr_amen["room"].concat(new_amen["room"]).uniq
            room.delete('tub') if room.include?('bathtub')

            {
                "general": general,
                "room": room
            }.to_json
        end

        def merge_images(curr_images, value)
            return curr_images if value.nil?
            return value if curr_images.nil?

            curr_img = ActiveSupport::JSON.decode(curr_images)
            new_img = ActiveSupport::JSON.decode(value)
            curr_img_keys = curr_img.keys
            new_img_keys = new_img.keys

            for key in curr_img_keys
                if new_img_keys.include?(key)
                    curr_img[key].concat(new_img[key]).uniq! { _1["link"] }
                    new_img_keys.delete(key)
                end
            end
            
            for key in new_img_keys
                curr_img[key] = new_img[key]
            end

            curr_img.to_json
        end

        def merge_booking_conditions(curr_booking_c, value)
            return curr_booking_c if value.nil?
            return value if curr_booking_c.nil?

            curr_bc = ActiveSupport::JSON.decode(curr_booking_c)
            new_bc = ActiveSupport::JSON.decode(value)

            curr_bc.concat(new_bc).uniq!

            curr_bc.to_json
        end

        private
        def fetch
            json_str = HTTP.get(@url).body.to_s
            @hotels = ActiveSupport::JSON.decode(json_str)
        end

        def update_hotel(hotel_parsed)
            hotel = Hotel.find_by(hotel_id: hotel_parsed.hotel_id)
            hotel.lat = merge_column hotel.lat, hotel_parsed.lat
            hotel.lng = merge_column hotel.lng, hotel_parsed.lng
            hotel.address = merge_column hotel.address, hotel_parsed.address
            hotel.city = merge_column hotel.city, hotel_parsed.city
            hotel.country = merge_column hotel.country, hotel_parsed.country
            hotel.postal_code = merge_column hotel.postal_code, hotel_parsed.postal_code
            hotel.description = merge_column hotel.description, hotel_parsed.description
            hotel.amenities = merge_amenities hotel.amenities, hotel_parsed.amenities
            hotel.images = merge_images hotel.images, hotel_parsed.images
            hotel.booking_conditions = merge_booking_conditions hotel.booking_conditions, hotel_parsed.booking_conditions

            hotel.save
        end

        def create_hotel(hotel_parsed)
            hotel = Hotel.create do |h|
                h.hotel_id = hotel_parsed.hotel_id
                h.destination_id = hotel_parsed.destination_id
                h.name = hotel_parsed.name
                h.lat = hotel_parsed.lat
                h.lng = hotel_parsed.lng
                h.address = hotel_parsed.address
                h.city = hotel_parsed.city
                h.country = hotel_parsed.country
                h.postal_code = hotel_parsed.postal_code
                h.description = hotel_parsed.description
                h.amenities = hotel_parsed.amenities
                h.images = hotel_parsed.images
                h.booking_conditions = hotel_parsed.booking_conditions
            end
    
            hotel.save
        end
    end
end