Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
  {
  	access_type: 'online', 
  	skip_jwt: true,
  	scope: "email, profile",
  	prompt: "select_account"
  }
end