class User < ApplicationRecord
  has_many :followers

  def self.from_omniauth(auth_info)
    # binding.pry
    where(uid: auth_info[:uid]).first_or_create do |user|
      user.uid = auth_info.uid
      user.name = auth_info.extra.raw_info.name
      user.screen_name = auth_info.extra.raw_info.login
      user.oauth_token = auth_info.credentials.token
    end
  end

  def create_followers
    followers_list.each do |follower|
      Follower.find_or_create_by(follower_uid: follower["id"]) do |f|
        f.user = self
        f.name = follower[:login]
        f.save
        binding.pry
      end
    end
  end

  def followers_list
    response = Faraday.get("https://api.github.com/users/squeemishly/followers")
    JSON.parse(response.body, symbolize_names: true)
  end
end
