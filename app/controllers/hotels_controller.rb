require 'http'

class HotelsController < ApplicationController
    def index
        p params[:ids]
        json = HTTP.get("https://5f2be0b4ffc88500167b85a0.mockapi.io/suppliers/acme").body.to_s
        p json 
    end
end
