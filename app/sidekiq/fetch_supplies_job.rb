class FetchSuppliesJob
  include Sidekiq::Job

  def perform
    Fetchers::AcmeHotels.new.load_hotels
    Fetchers::PaperfliesHotels.new.load_hotels
    Fetchers::PatagoniaHotels.new.load_hotels
  end
end
