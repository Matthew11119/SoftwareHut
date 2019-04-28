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
#  station_result_id :integer
#

class CriteriaResult < ApplicationRecord
  belongs_to :station_result, optional: true, :foreign_key=>:station_result_id
  has_one :criteria, :foreign_key=>:criterium_id
  has_one :station_result
  attr_accessor :criteria_mark, :id
end
