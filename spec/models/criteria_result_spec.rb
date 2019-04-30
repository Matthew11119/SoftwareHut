# == Schema Information
#
# Table name: criteria_results
#
#  id                :bigint(8)        not null, primary key
#  answer            :integer
#  criteria_mark     :integer
#  feedback          :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  criterium_id      :integer
#  station_id        :integer
#  station_result_id :bigint(8)
#
# Indexes
#
#  index_criteria_results_on_station_result_id  (station_result_id)
#
# Foreign Keys
#
#  fk_rails_...  (station_result_id => station_results.id)
#

require 'rails_helper'

RSpec.describe CriteriaResult, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "Factory bot creates" do
    criteria_result = FactoryBot.build(:criteria_result)
    expect(criteria_result).to be_valid
  end

  it { should belong_to :station_result }

end
