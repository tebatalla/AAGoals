# == Schema Information
#
# Table name: goal_comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  author_id  :integer          not null
#  goal_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :goal_comment do
    content "MyText"
author_id 1
goal_id 1
  end

end
