# == Schema Information
#
# Table name: attachment_views
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  attachment_id :integer          not null
#  customer_id   :integer          not null
#
# Indexes
#
#  index_attachment_views_on_attachment_id  (attachment_id)
#  index_attachment_views_on_customer_id    (customer_id)
#
# Foreign Keys
#
#  attachment_id  (attachment_id => attachments.id)
#  customer_id    (customer_id => customers.id)
#
require "test_helper"

class AttachmentViewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
