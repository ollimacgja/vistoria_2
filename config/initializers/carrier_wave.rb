CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJHRLSFKWY2QHBYYQ',                        # required
    aws_secret_access_key: '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',    # required
    region:                'us-west-2'
  }
  #config.fog_directory  = Rails.env.production? ? 'vistoria-production' : 'vistoria-development'                          # required
  config.fog_directory  = 'vistoria-production'
end