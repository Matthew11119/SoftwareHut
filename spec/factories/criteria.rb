# == Schema Information
#
# Table name: criteria
#
#  id                   :bigint(8)        not null, primary key
#  criteria_critical    :boolean
#  criteria_description :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  criteria_id          :integer
#  station_id           :integer
#

FactoryBot.define do
  factory :criterium do
    criteria_id { 1 }
    criteria_description { "MyText" }
    criteria_critical { false }
    station_id { 1 }
  end
end
