class Hotel < ApplicationRecord
    GENERAL_AMENITIES = ["childcare", "pool", "outdoor pool", "indoor pool", "business center", "wifi", "parking", "bar",
                        "dry cleaning", "breakfast", "concierge"].freeze
    ROOM_AMENITIES = ["tv", "coffee machine", "kettle", "hair dryer", "iron", "aircon", "minibar", "bathtub", "tub"].freeze

    validates :hotel_id, presence: true
    validates :destination_id, presence: true
    validates :name, presence: true
end
