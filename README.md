# Data Merging

[Task](https://gist.github.com/melvrickgoh/e7266f09bc346e6624e3db5843f25637)

- [ ] Parsers are at `app/helpers/*_parser.rb`
   - Using Template pattern so that whenever there is a new supplier, we can simply add a new parser file by inheriting from `HotelParser`.

- [ ] Setup migrations for:
   - [ ] Create Hotels
      - hotel_id, destination_id, name, lat, lng, etc.
   - [ ] Create HotelSuppliers
      - url, json
      - compare json fetched to see anything has changed.