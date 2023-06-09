require 'http'

class HotelsController < ApplicationController
    include Formatable

    def index
        @hotels = Hotel.where(hotel_id: params[:ids])
        formatted_hotels = @hotels.map do |h|
            format_hotel h
        end
        render json: formatted_hotels
    end
end