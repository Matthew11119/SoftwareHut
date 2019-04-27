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

class StationResult < ApplicationRecord
  belongs_to :station, :foreign_key=>:station_id

  has_many :criteria_results, inverse_of: :station_results
  accepts_nested_attributes_for :criteria_results
end
