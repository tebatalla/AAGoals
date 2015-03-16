require 'spec_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content("New User")
  end

  feature "signing up a user" do
    before(:each) do
      @username = 'test_user'
      visit new_user_url
      fill_in 'username', with: @username
      fill_in 'password', with: 'testtest'
      click_on 'Create User'
    end

    it "shows username on the homepage after signup" do
      expect(page).to have_content @username
      expect(page.status_code).to eq(200)
    end

  end

end

feature "logging in" do

  before(:each) do
    visit new_session_url
    @user = create(:user)
  end

  it "has a log in page" do
    expect(page).to have_content('Log In')
  end

  it "shows username on the homepage after login" do
    fill_in 'username', with: @user.username
    fill_in 'password', with: @user.password
    click_on 'Log In'
    expect(page).to have_content @user.username
    expect(page.status_code).to eq(200)
  end

end

feature "logging out" do

  it "begins with logged out state" do
    visit new_session_url
    @user = create(:user)
    expect(page).to_not have_content @user.username
  end

  it "doesn't show username on the homepage after logout" do
    visit new_session_url
    @user = create(:user)
    fill_in 'username', with: @user.username
    fill_in 'password', with: @user.password
    click_on 'Log In'
    click_on 'Log Out'
    expect(page).to_not have_content @user.username
  end

end
