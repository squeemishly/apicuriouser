require 'rails_helper'

RSpec.describe StarredRepo do
  context "relationships" do
    it "responds to user" do
      sr = StarredRepo.create
      expect(sr).to respond_to :user
    end
  end
end
