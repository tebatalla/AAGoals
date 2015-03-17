require 'spec_helper'

feature "cheers for a goal" do
  before(:each) do
    @user = create(:user)
    @other_user = create(:user, username: Faker::Internet.user_name)
    log_in(user)
    @goals = Array.new(5) { create(:goal, user_id: @other_user.id, title: Faker::Lorem.sentence) }
  end

  it "adds a cheer for a goal" do
    visit user_url(@other_user)
    click 'goal0'
    

  end

  it "prohibits adding a cheer when max is reached" do

  end
end
