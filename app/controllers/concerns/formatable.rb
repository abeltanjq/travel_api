module Formatable
    extend ActiveSupport::Concern

    included do
        def format_hotel(h)
            {
                id: h.hotel_id,
                destination_id: h.destination_id,
                name: h.name,
                location: {
                    lat: h.lat,
                    lng: h.lng,
                    address: h.address,
                    city: h.city,
                    country: h.country
                },
                description: h.description,
                amenities: h.amenities,
                images: h.images,
                booking_conditions: h.booking_conditions
            }
        end
    end
end