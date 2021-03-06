# == Schema Information
#
# Table name: criteria
#
#  id                   :bigint(8)        not null, primary key
#  criteria_critical    :boolean
#  criteria_description :text
#  number               :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  station_id           :integer
#

class Criterium < ApplicationRecord
  belongs_to :station, :foreign_key=>:station_id
  has_many :criteria_results, inverse_of: :criterium
end
