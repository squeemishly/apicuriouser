require 'rails_helper'

RSpec.describe User, type: :model do
  context "fields of data" do
    attr_reader :user

    before(:all) do
      @user = User.create(
      uid: "2048758273",
      name: "George The Great",
      screen_name: "Georalicious",
      oauth_token: "oiarenduyo908aroeitn932rtoeoenaor",
      pic: "arosednoahdyu"
      )
    end

    it "has a uid" do
      expect(user.uid).to eq "2048758273"
    end

    it "has a name" do
      expect(user.name).to eq "George The Great"
    end

    it "has a screen_name" do
      expect(user.screen_name).to eq "Georalicious"
    end

    it "has a oauth token" do
      expect(user.oauth_token).to eq "oiarenduyo908aroeitn932rtoeoenaor"
    end

    it "has a pic" do
      expect(user.pic).to eq "arosednoahdyu"
    end
  end

  VCR.use_cassette("user relationships") do
    context "relationships" do
      attr_reader :user

      before(:all) do
        stub_omniauth
        @user = User.first
      end

      it "responds to followers" do
        expect(user).to respond_to(:followers)
      end

      it "responds to following" do
        expect(user).to respond_to(:following)
      end

      it "responds to starred_repos" do
        expect(user).to respond_to(:starred_repos)
      end

      it "responds to orgs" do
        expect(user).to respond_to(:orgs)
      end
    end
  end

  VCR.use_cassette("user methods") do
    context "methods" do
      attr_reader :user

      before(:all) do
        stub_omniauth
        @user = User.first
      end

      # it "can create a followers list" do
      #   expect(Follower.count).to eq 0
      #
      #   user.create_followers
      #   expect(Follower.count).to eq 4
      # end
    end
  end
end
