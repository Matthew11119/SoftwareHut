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
#  station_result_id :integer
#

class CriteriaResult < ApplicationRecord
  belongs_to :station_results, :foreign_key=>:station_result_id
end
