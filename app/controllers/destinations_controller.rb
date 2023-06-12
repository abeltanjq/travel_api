class DestinationsController < ApplicationController
    include Formatable

    def show
        @hotels = Hotel.where(destination_id: params[:id])
        formatted_hotels = @hotels.map do |h|
            format_hotel h
        end
        render json: formatted_hotels
    end
end
