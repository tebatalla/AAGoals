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

require 'rails_helper'

RSpec.describe Goal, type: :model do
end
