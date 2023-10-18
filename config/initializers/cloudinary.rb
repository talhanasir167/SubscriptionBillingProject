# frozen_string_literal: true

Cloudinary.config do |config|
  config.cloud_name = Rails.application.credentials[:cloud][:cloud_name]
  config.api_key = Rails.application.credentials[:cloud][:api_key]
  config.api_secret = Rails.application.credentials[:cloud][:api_secret]
  config.secure = true
  config.cdn_subdomain = true
end
