require 'spec_helper'

feature 'creating a goal' do

  before(:each) do
    @user = create(:user)
    @other_user = create(:user, username: Faker::Internet.user_name)

    #log in
    visit new_session_url
    fill_in 'username', with: @user.username
    fill_in 'password', with: @user.password
    click_on 'Log In'
  end

  it "creates a private goal" do
    visit new_goal_url
    goal = 'climb mount everest'
    fill_in 'Title', with: goal
    choose('Private')
    click_on 'Create Goal'

    expect(current_url).to eq(user_url(@user))
    expect(page).to have_content goal
    expect(page).to have_content "Private"
    expect(page.status_code).to eq(200)

    # log out
    click_on 'Log Out'
    visit new_session_url
    fill_in 'username', with: @other_user.username
    fill_in 'password', with: @other_user.password
    click_on 'Log In'
    visit user_url(@user)
    expect(page).to_not have_content goal
  end

  it "creates a public goal" do

  end

end
