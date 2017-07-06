Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :github, '65ebc3625c0a9293fac9', 'e4ad5c8b66eb78b7b534dcaaed35302652a1099b', scope: "user,repo,gist"
end
