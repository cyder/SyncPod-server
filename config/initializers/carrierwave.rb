if Rails.env.production? || Rails.env.staging?
  CarrierWave.configure do |config|
    config.fog_provider = "fog/aws"
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["S3_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["S3_SECRET_KEY_ID"],
      region: ENV["S3_REGION"],
    }

    config.fog_directory = ENV["S3_BUCKET_NAME"]
    config.cache_storage = :fog
    config.fog_public = true
    config.asset_host = ENV["ASSET_HOST"]
  end
else
  CarrierWave.configure do |config|
    config.storage = :file
  end
end
