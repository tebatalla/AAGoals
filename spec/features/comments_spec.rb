require 'spec_helper'

feature "comments" do
  before(:each) do
    @user = create(:user)
    log_in(@user)
    @goal = create(:goal, user_id: @user.id)
    @other_user = create(:user, username: Faker::Internet.user_name)
  end

  it "can comment on goal" do
    visit goal_url(@goal)
    expect(page).to have_content 'Add Comment'
    comment = 'This is a nice goal'
    fill_in 'content', with: comment
    click_on 'Submit'

    expect(current_url).to eq(goal_url(@goal))
    expect(page).to have_content comment
    expect(page.status_code).to eq(200)
  end

  it "can comment on user" do
    visit user_url(@user)
    expect(page).to have_content 'Add Comment'
    comment = 'This is a nice user'
    fill_in 'content', with: comment
    click_on 'Submit'

    expect(current_url).to eq(user_url(@user))
    expect(page).to have_content comment
    expect(page.status_code).to eq(200)

    visit user_url(@other_user)
    expect(page).to_not have_content comment
  end

end
