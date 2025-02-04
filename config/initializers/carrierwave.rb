require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
 
CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'felice-chizuru-prod'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],

# 直打ちのままgithubには絶対にpushしない 
      region: "ap-northeast-1",
      path_style: true
    }
  else
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'felice-chizuru'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],

# 直打ちのままgithubには絶対にpushしない 
      region: "ap-northeast-1",
      path_style: true
    }
  end
end
 
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/