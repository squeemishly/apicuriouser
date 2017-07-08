class User < ApplicationRecord
  has_many :followers
  has_many :following
  has_many :starred_repos

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |user|
      user.uid = auth_info.uid
      user.name = auth_info.extra.raw_info.name
      user.screen_name = auth_info.extra.raw_info.login
      user.oauth_token = auth_info.credentials.token
    end
  end

  def prep_user
    create_followers
    create_following
    create_starred_repos
  end

  def create_followers
    GithubService.create_list("followers", self).each do |follower|
      Follower.find_or_create_by(follower_uid: follower[:id]) do |f|
        f.user = self
        f.name = follower[:login]
        f.save
      end
    end
  end

  def create_following
    GithubService.create_list("following", self).each do |following|
      Following.find_or_create_by(following_id: following[:id]) do |f|
        f.name = following[:login]
        f.user = self
        f.save
      end
    end
  end

  def create_starred_repos
    GithubService.create_list("starred", self).each do |starred|
      StarredRepo.find_or_create_by(starred_id: starred[:id]) do |s|
        s.full_name = starred[:full_name]
        s.user = self
        s.save
      end
    end
  end
  # 
  # private
  #
  # def create_list(type)
  #   response = Faraday.get("https://api.github.com/users/#{screen_name}/#{type}")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  # def followers_list
  #   response = Faraday.get("https://api.github.com/users/#{screen_name}/followers")
  #   JSON.parse(response.body, symbolize_names: true)
  # end
  #
  # def following_list
  #   response = Faraday.get("https://api.github.com/users/#{screen_name}/following")
  #   JSON.parse(response.body, symbolize_names: true)
  # end
  #
  # def starred_repos_list
  #   response = Faraday.get("https://api.github.com/users/#{screen_name}/starred")
  #   JSON.parse(response.body, symbolize_names: true)
  # end
end
