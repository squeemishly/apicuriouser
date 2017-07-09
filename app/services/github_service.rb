class GithubService
  # def initialize
  #   @conn = Faraday.new(url: "https://api.github.com/users")
  # end

  def self.create_list(type, user)
    # response = conn.get "/#{user.screen_name}/#{type}"
    response = Faraday.get "https://api.github.com/users/#{user.screen_name}/#{type}"
    JSON.parse(response.body, symbolize_names: true)
  end

  # private
  # attr_reader :conn
end
