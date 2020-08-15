require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
 
CarrierWave.configure do |config|
#   if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'felice-chizuru'
    config.fog_credentials = {
      provider: 'AWS',
     #  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
     #  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      aws_access_key_id: "AKIAZUOMWINGY5H74VHK",
      aws_secret_access_key: "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",
# 直打ちのままgithubには絶対にpushしない 
      region: "ap-northeast-1",
      path_style: true
    }
#   else
#    config.storage :file
#    config.enable_processing = false if Rails.env.test?
#   end
 end
 
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/