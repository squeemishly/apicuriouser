require 'rails_helper'

RSpec.describe "a user can login using github" do
  include Capybara::DSL
  before (:each) do
    Capybara.app = Apicuriouser::Application
    stub_omniauth
    visit root_path
  end

  it "has a login button" do
    expect(page.status_code).to eq 200
    expect(find_link('Login')[:href]).to eq('https://github.com/login/oauth/authorize?client_id=6153c1ab28fd525b9111&scope=repo')
  end

  it "can log me in" do
    click_on "Login"
    expect(current_path).to eq "/"
    expect(page).to have_content("squee")
    expect(page).to have_link("Logout")
  end

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
          uid: "1234",
          name: "squee",
          screen_name: "KITTY!!!",
        }
      },
      credentials: {
        token: "boudithecat",
        secret: "sheswhereitsat"
      }
    })
  end
end
