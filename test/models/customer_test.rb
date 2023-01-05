# == Schema Information
#
# Table name: customers
#
#  id               :integer          not null, primary key
#  email            :string           not null
#  session_token    :string
#  token_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  store_id         :integer          not null
#  stripe_id        :string
#
# Indexes
#
#  index_customers_on_store_id  (store_id)
#
# Foreign Keys
#
#  store_id  (store_id => stores.id)
#
require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
