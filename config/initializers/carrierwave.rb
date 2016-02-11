# config/initializers/carrierwave.rb
# This file is not created by default so you might have to create it yourself.

CarrierWave.configure do |config|

  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJDPA26ILKT4K774A',                        # required
    aws_secret_access_key: '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',                        # required
  }
  config.fog_directory  = 'drink-wheel'               # required
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end