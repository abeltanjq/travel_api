require 'http'
require_relative 'hotel_supply'

module Fetchers
    PAPERFLIES = "https://5f2be0b4ffc88500167b85a0.mockapi.io/suppliers/paperflies"
    
    class PaperfliesHotels < HotelSupply
        def initialize
            super(PAPERFLIES)
        end

        def parse_hotel(hotel)
            PaperfliesParser.new(hotel)
        end
    end
end
