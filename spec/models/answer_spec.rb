# == Schema Information
#
# Table name: answers
#
#  id         :bigint(8)        not null, primary key
#  score      :integer
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  station_id :integer
#

require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
