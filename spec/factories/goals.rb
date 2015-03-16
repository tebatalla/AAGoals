# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  private    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean
#

FactoryGirl.define do
  factory :goal do
    title "Something"
    user_id 1
    is_private false
    completed false
  end

end
