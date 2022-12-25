# == Schema Information
#
# Table name: accounts
#
#  id                   :integer          not null, primary key
#  charges_enabled      :boolean
#  payouts_enabled      :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  external_account_id  :string
#  financial_account_id :string
#  stripe_id            :string
#  user_id              :integer          not null
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
