class GithubService
  def self.create_list(type, user)
    response = Faraday.get("https://api.github.com/users/#{user.screen_name}/#{type}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
