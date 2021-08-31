CarrierWave.configure do |config|
  config.storage = :gcloud
  config.gcloud_bucket                       = ENV['GOOGLE_BUCKET']    # Better fetch this from environment variables
  config.gcloud_bucket_is_public             = false
  config.gcloud_authenticated_url_expiration = 600
  config.gcloud_content_disposition          = 'attachment' # or you can skip this

  config.gcloud_attributes = {
    expires: 600
  }

  config.gcloud_credentials = {
    gcloud_project: ENV['GOOGLE_BUCKET'], # Better fetch this from environment variables
    gcloud_keyfile: ENV['GOOGLE_BUCKET_KEY']                      # Better fetch this from environment variables
  }
end
