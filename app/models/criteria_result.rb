# == Schema Information
#
# Table name: criteria_results
#
#  id                   :bigint(8)        not null, primary key
#  answer               :integer
#  criteria_mark        :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  criteria_feedback_id :integer
#  station_id           :integer
#

class CriteriaResult < ApplicationRecord
  belongs_to :stations
end
