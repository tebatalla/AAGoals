# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  is_private :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean
#

class Goal < ActiveRecord::Base
  include Commentable
  validates :title, :user_id, presence: true
  validates :is_private, :completed, inclusion: { in: [true, false] }

  after_initialize :ensure_completion_value

  belongs_to :user

  private
    def ensure_completion_value
      self.completed ||= false
    end

end
