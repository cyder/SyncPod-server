if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["S3_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["S3_SECRET_KEY_ID"],
      region: "ap-northeast-1",
    }

    config.fog_directory = ENV["S3_BUCKET_NAME"]
    config.cache_storage = :fog
    config.fog_public = true
  end
else
  CarrierWave.configure do |config|
    config.storage = :file
  end
end
