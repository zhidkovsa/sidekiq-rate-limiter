require 'sidekiq-rate-limiter/version'
require 'sidekiq-rate-limiter/fetch'

Sidekiq.configure_server do |config|
#   Sidekiq.options[:fetch] = Sidekiq::RateLimiter::Fetch

  Sidekiq.options[:fetch] =
    if Gem::Version.new(Sidekiq::VERSION) < Gem::Version.new("6.1.0")
      Sidekiq::RateLimiter::Fetch
    else
      Sidekiq::RateLimiter::Fetch.new(Sidekiq.options)
    end
end
