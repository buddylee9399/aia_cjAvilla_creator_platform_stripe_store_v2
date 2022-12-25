# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  data              :json
#  processing_errors :text
#  source            :string
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Event < ApplicationRecord
end
