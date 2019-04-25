# == Schema Information
#
# Table name: stations
#
#  id           :bigint(8)        not null, primary key
#  pass_mark    :integer
#  station_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  exam_id      :string
#  template_id  :integer
#

require 'rails_helper'

RSpec.describe Station, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
