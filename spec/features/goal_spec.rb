require 'spec_helper'

feature 'creating a goal' do

  before(:each) do
    @user = create(:user)
    @other_user = create(:user, username: Faker::Internet.user_name)

    log_in(@user)
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
    log_in(@other_user)
    visit user_url(@user)
    expect(page).to_not have_content goal
  end

  it "creates a public goal" do
    visit new_goal_url
    goal = 'climb mount everest'
    fill_in 'Title', with: goal
    choose('Public')
    click_on 'Create Goal'

    expect(current_url).to eq(user_url(@user))
    expect(page).to have_content goal
    expect(page.status_code).to eq(200)

    click_on 'Log Out'
    log_in(@other_user)
    visit user_url(@user)
    expect(page).to have_content goal
  end

end

feature "edit goal process" do
  before(:each) do
    @user = create(:user)
    log_in(@user)
    @private_goal = create(:goal, user_id: @user.id, is_private: true)
    @goal = create(:goal, user_id: @user.id, is_private: false, title: 'Play golf')
  end

  it "should edit a goal" do
    visit edit_goal_url(@private_goal)
    new_goal = "Climb Mount Kilimanjaro"
    fill_in 'Title', with: new_goal
    choose('Public')
    click_on "Edit Goal"

    expect(current_url).to eq(user_url(@user))
    expect(page).to have_content new_goal
    expect(page).to_not have_content "#{new_goal} (Private)"
  end

  it "should be completeable" do
    visit edit_goal_url(@goal)
    check 'Complete'
    click_on 'Edit Goal'
    expect(page).to_not have_content "#{@goal.title} (Completed)"
    expect(page.status_code).to eq(200)
  end

end

feature "goal completion" do

  before(:each) do
    @user = create(:user)
    log_in(@user)
  end

  it "not be completed by default" do
    click_on "New Goal"
    fill_in "Title", with: "Eat korean bbq"
    choose("Public")
    click_on "Create Goal"
    expect(page).to have_content "Eat korean bbq"
    expect(page).to_not have_content "Eat korean bbq (Completed)"
  end

end

feature "delete a goal" do
  it "deletes a goal" do
    @user = create(:user)
    @goal = create(:goal, user_id: @user.id, is_private: false, title: 'Play golf')
    log_in(@user)
    click_on "Delete Goal"

    expect(page).to_not have_content "#{@goal.title}"
    expect(page.status_code).to eq(200)
  end

end
