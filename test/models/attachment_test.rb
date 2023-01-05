# == Schema Information
#
# Table name: attachments
#
#  id          :integer          not null, primary key
#  name        :string
#  views_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer          not null
#
# Indexes
#
#  index_attachments_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
require "test_helper"

class AttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
