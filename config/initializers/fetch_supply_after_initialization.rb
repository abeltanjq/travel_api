require_relative "../../app/helpers/fetchers/acme_hotels"
require_relative "../../app/helpers/fetchers/patagonia_hotels"
require_relative "../../app/helpers/fetchers/paperflies_hotels"

Rails.application.config.after_initialize do
    unless Rails.env.test?
        FetchSuppliesJob.perform_async
    end
end