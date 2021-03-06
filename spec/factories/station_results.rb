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
#

FactoryBot.define do
  factory :station_result do
    id { 1 }
    station_id { 1 }
    #student_id { 1 }
    examiner_name { "MyString" }
    mark { 1 }
    feedback { "MyString" }
    audio { "MyString" }
  end
end
