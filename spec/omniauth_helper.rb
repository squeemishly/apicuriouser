def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: 'github',
    uid: 1234,
    extra: {
      raw_info: {
        name: "Kristen (Squee) Mueller",
        login: "squeemishly",
      }
    },
    credentials: {
      token: ENV["github_user_token"],
    }
  })
end
