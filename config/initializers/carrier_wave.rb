if Rails.env.production
  CarrierWave.configure do |config|
  	config.fog_credentials = {
  	  :provider => 'AWS'
  	  :aws_access_keyt_id => ENV['S3_ACCESS_KEY'],
  	  :aws_secret_access_key => ENV['S3_SECRET_KET']
  	}

    config.fog_directory = ENV['S3_BUCKET']

  end

end