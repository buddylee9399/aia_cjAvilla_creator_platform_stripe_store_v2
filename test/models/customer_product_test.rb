# == Schema Information
#
# Table name: customer_products
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  checkout_session_id :string
#  customer_id         :integer          not null
#  product_id          :integer          not null
#
# Indexes
#
#  customer_product_session_index          (customer_id,product_id,checkout_session_id) UNIQUE
#  index_customer_products_on_customer_id  (customer_id)
#  index_customer_products_on_product_id   (product_id)
#
# Foreign Keys
#
#  customer_id  (customer_id => customers.id)
#  product_id   (product_id => products.id)
#
require "test_helper"

class CustomerProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
