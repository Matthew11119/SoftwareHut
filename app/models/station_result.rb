# == Schema Information
#
# Table name: station_results
#
#  id            :bigint(8)        not null, primary key
#  audio         :string
#  examiner_name :string
#  feedback      :string
#  mark          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  station_id    :integer
#  student_id    :integer
#

class StationResult < ApplicationRecord
  belongs_to :stations
end