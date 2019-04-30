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

FactoryBot.define do
  factory :criterium do
    id { 1 }
    criteria_description { "MyText" }
    criteria_critical { false }
    station_id { 1 }
  end
end
