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
class Store < ApplicationRecord
  belongs_to :user
  has_many :products, through: :user
  has_many :customers, through: :products  
  
  def self.find_by_request(request)
    puts "Finding by request"

    where(domain: request.domain)
      .or(where(subdomain: request.subdomain))
      .first
  end  
end

