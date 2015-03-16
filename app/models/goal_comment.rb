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

class GoalComment < ActiveRecord::Base
  validates :content, :author_id, :goal_id, presence: true

  belongs_to :goal

  belongs_to :author, class_name: 'User'
end
