# == Schema Information
#
# Table name: criteria_results
#
#  id            :bigint(8)        not null, primary key
#  answer        :integer
#  criteria_mark :integer
#  feedback      :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  station_id    :integer
#

require 'rails_helper'

RSpec.describe CriteriaResult, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
