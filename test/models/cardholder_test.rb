# == Schema Information
#
# Table name: cardholders
#
#  id         :integer          not null, primary key
#  data       :json
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stripe_id  :string
#  user_id    :integer          not null
#
# Indexes
#
#  index_cardholders_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class CardholderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
