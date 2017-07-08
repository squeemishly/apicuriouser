require 'rails_helper'

RSpec.describe "a user can see their information" do
  it "when they visit their profile" do
    # When I visit the root
    visit root_path
    # And I click on Login
    click_on "Login"

    # I will return to the root
    expect(current_path).to eq "/"
    # When I click on "My Account"
    click_on "My Account"
    # I will be taken to my Account
    expect(current_path).to eq account_index_path
    # And I will see my username
    expect(page).to have_selector(".username")
    # And I will see my profile pic
    expect(page).to have_selector(".profile_pic")
    # And I will see the number of starred repos I have
    expect(page).to have_selector(".starred_repos")
    # And I will see how many people are following me
    expect(page).to have_selector(".followers")
    # And I will see how many people I follow
    expect(page).to have_selector(".following")
  end
end
