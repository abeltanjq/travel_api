require 'http'
require_relative 'hotel_supply'

module Fetchers
    ACME = "https://5f2be0b4ffc88500167b85a0.mockapi.io/suppliers/acme"
    
    class AcmeHotels < HotelSupply
        def initialize
            super(ACME)
        end

        def parse_hotel(hotel)
            AcmeParser.new(hotel)
        end
    end
end
