class GithubService
  def initialize(type)
    @type = type
  end

  def self.create_list(type)
    url = "https://api.github.com/users/#{screen_name}/#{type}"
    response = Faraday.get("https://api.github.com/users/#{screen_name}/#{type}")
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :type
end
