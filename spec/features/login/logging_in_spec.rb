require 'rails_helper'

RSpec.describe "a user can login using github" do
  VCR.use_cassette("login") do
    before (:each) do
      stub_omniauth
      visit root_path
    end

    it "has a login button" do
      expect(page.status_code).to eq 200
      expect(find_link('Login')[:href]).to eq github_login_path
    end

    it "can log me in" do
      click_on "Login"
      expect(current_path).to eq "/"
      expect(page).to have_content("squee")
      expect(page).to have_link("Logout")
    end
  end
end
