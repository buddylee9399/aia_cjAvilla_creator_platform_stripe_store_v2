# == Schema Information
#
# Table name: cards
#
#  id            :integer          not null, primary key
#  data          :json
#  last4         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  cardholder_id :integer          not null
#  stripe_id     :string
#
# Indexes
#
#  index_cards_on_cardholder_id  (cardholder_id)
#
# Foreign Keys
#
#  cardholder_id  (cardholder_id => cardholders.id)
#
class Card < ApplicationRecord
  belongs_to :cardholder
end
