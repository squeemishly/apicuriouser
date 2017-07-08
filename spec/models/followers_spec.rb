require 'rails_helper'

RSpec.describe Follower do
  context "relationships" do
    it "responds to user" do
      follower = Follower.create
      expect(follower).to respond_to :user
    end
  end
end
