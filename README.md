# Data Merging

[Task](https://gist.github.com/melvrickgoh/e7266f09bc346e6624e3db5843f25637)


# Starting the app
Install Redis on Mac
```
brew install redis
# start redis server (in a separate terminal)
redis-server
# stop redis server: Ctrl + C
```

Start Sidekiq (after redis is up)
```
bundle exec sidekiq
# stop sidekiq: Ctrl + C
```

Start Rails server
```sh
bundle install
bin/rails db:migrate
bin/rails s # for server
```

# Running Test
Run:
```sh
rake db:test:prepare # When running test for the first time
bin/rails test
```

# APIs

Getting hotels by ids
```sh
/hotels?ids[]=iJhz&ids[]=SjyX&ids[]=f8c9

eg. curl 'http://127.0.0.1:3000/hotels?ids[]=iJhz&ids[]=SjyX&ids[]=f8c9'
```

Getting destination by id.
```sh
/destinations/:id

eg. curl 'http://127.0.0.1:3000/destinations/5432'
```

# Main files
## Controllers
`app/controllers`

## Parsers
`app/helpers/*_parser.rb` -> These are used to extract data from suppliers in a organized format for easier merging later.

## Fetchers
`app/helpers/fetchers` -> Fetchers are used to fetch data from suppliers and load the info in the database.

## Models
`app/models/hotel.rb`

## Initializers
`config/initializers/fetch_supply_after_initialization.rb` -> An asynchronous sidekiq job will be triggered to fetch and store data from supplies

## Sidekiq Job
`app/sidekiq/fetch_supplies_job.rb` -> Used the fetchers to get data from suppliers.

# Optimizations
Data procurement - Fetching of data is done by a non-blocking async job that is triggered after initialization of rails app.

Delivering data - Since data is stored in the database, whenever there is a GET request, we will retrieve the merged data from our db.