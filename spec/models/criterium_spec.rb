# == Schema Information
#
# Table name: criteria
#
#  id                   :bigint(8)        not null, primary key
#  criteria_critical    :boolean
#  criteria_description :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  criteria_id          :integer
#  station_id           :integer
#

require 'rails_helper'

RSpec.describe Criterium, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
