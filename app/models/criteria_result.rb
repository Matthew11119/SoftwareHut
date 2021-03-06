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

class CriteriaResult < ApplicationRecord
  belongs_to :station_result, :foreign_key=>:station_result_id
  has_one :criterium, :foreign_key=>:criterium_id
  attr_accessor :criteria_mark  
end
