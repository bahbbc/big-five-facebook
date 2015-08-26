require 'sidekiq/web'

if Rails.env.production?
  uri = URI.parse(ENV["REDISTOGO_URL"])

  Sidekiq.configure_client do |config|
    config.redis = { url: "redis://#{uri.host}:#{uri.port}"}
  end

  Sidekiq.configure_server do |config|
    config.redis = { url: "redis://#{uri.host}:#{uri.port}"}
  end
end
