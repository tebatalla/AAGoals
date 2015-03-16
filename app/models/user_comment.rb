# == Schema Information
#
# Table name: user_comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  author_id  :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserComment < ActiveRecord::Base
  validates :content, :author_id, :user_id, presence: true
  belongs_to :user
  belongs_to :author, class_name: 'User'
end
