require 'rails_helper'

RSpec.describe Following do
  context "relationships" do
    it "responds to users" do
      following = Following.create
      expect(following).to respond_to :user
    end
  end
end
