CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'test-bucket-takeda'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AKIAS53NE74QLGCTUYVP'],
      aws_secret_access_key: ENV['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'],
      region: ENV['ap-northeast-1'],
      path_style: true
    }
  else
    config.storage :fog
    config.enable_processing = false if Rails.env.test?
  end
end
 
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/