require 'rails_helper'

RSpec.describe "a user can see their information" do
  it "when they first login to the website" do
    # When I visit the root
    visit root_path
    # And I click on Login
    click_on "Login"

    # I will be taken to my Account page
    expect(current_path).to eq "/"
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
