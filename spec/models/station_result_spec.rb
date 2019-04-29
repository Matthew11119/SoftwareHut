# == Schema Information
#
# Table name: station_results
#
#  id            :bigint(8)        not null, primary key
#  audio         :string
#  examiner_name :string
#  feedback      :string
#  mark          :integer
#  username      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  station_id    :integer
#  student_id    :string
#

require 'rails_helper'

RSpec.describe StationResult, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates with FactoryBot" do
    station_result = FactoryBot.build(:station_result)
    expect(station_result).to be_valid
  end

end
