require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(
    uid: "2048758273",
    name: "George The Great",
    screen_name: "Georalicious",
    oauth_token: "oiarenduyo908aroeitn932rtoeoenaor",
    )
  end

  context "fields of data" do
    it "has a uid" do
      expect(@user.uid).to eq "2048758273"
    end

    it "has a name" do
      expect(@user.name).to eq "George The Great"
    end

    it "has a screen_name" do
      expect(@user.screen_name).to eq "Georalicious"
    end

    it "has a oauth token" do
      expect(@user.oauth_token).to eq "oiarenduyo908aroeitn932rtoeoenaor"
    end
  end

  context "relationships" do
    it "responds to followers" do
      expect(@user).to respond_to(:followers)
    end
  end
end
