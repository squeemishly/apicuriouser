require 'rails_helper'

RSpec.describe "a user can login using github" do
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

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: "1234",
      extra: {
        raw_info: {
          name: "Kristen (Squee) Mueller",
          login: "squeemishly",
        }
      },
      credentials: {
        token: ENV["github_user_token"],
      }
    })
  end
end
