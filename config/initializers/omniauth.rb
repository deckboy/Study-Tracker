OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "292614196243-mmcsl3l5bktpqdhipd8sr89g64mipfir.apps.googleusercontent.com", "bsaU_c1ePWalyDxPEgvbXvc7"
end
