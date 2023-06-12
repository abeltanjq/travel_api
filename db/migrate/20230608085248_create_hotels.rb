class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :hotel_id
      t.string :destination_id
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.string :address
      t.string :city
      t.string :country
      t.string :postal_code
      t.text :description
      t.text :amenities
      t.text :images
      t.text :booking_conditions
      t.timestamps
    end
  end
end
