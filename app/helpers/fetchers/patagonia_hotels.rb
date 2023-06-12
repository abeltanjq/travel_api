require 'http'
require_relative 'hotel_supply'

module Fetchers
    PATAGONIA = "https://5f2be0b4ffc88500167b85a0.mockapi.io/suppliers/patagonia"
    
    class PatagoniaHotels < HotelSupply
        def initialize
            super(PATAGONIA)
        end
        
        def parse_hotel(hotel)
            PatagoniaParser.new(hotel)
        end
    end   
end
