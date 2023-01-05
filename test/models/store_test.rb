# == Schema Information
#
# Table name: stores
#
#  id              :integer          not null, primary key
#  domain          :string
#  primary_color   :string
#  secondary_color :string
#  subdomain       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer          not null
#
# Indexes
#
#  index_stores_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
