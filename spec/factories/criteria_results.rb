# == Schema Information
#
# Table name: criteria_results
#
#  id            :bigint(8)        not null, primary key
#  answer        :integer
#  criteria_mark :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  station_id    :integer
#

FactoryBot.define do
  factory :criteria_result do
    criteria_feedback_id { 1 }
    criteria_mark { 1 }
    answer { 1 }
    station_id { 1 }
  end
end