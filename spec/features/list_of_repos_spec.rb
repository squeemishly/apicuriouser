require 'rails_helper'

RSpec.describe "I can see a list of my repos" do
  before(:all) do
    stub_omniauth
  end
  it "from my account page" do
    # When I am in my account
    visit '/'
    click_on "Login"
    click_on "My Account"
    expect(current_path).to eq '/account'
    # I will see a page displaying my recent commits
    expect(page).to have_selector ".repo"
    expect(page).to have_selector ".name"
  end
end
