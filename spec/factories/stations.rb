# == Schema Information
#
# Table name: stations
#
#  id           :bigint(8)        not null, primary key
#  pass_mark    :integer
#  station_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  exam_id      :integer
#

FactoryBot.define do
  factory :station do
    station_id { 1 }
    station_name { "MyString" }
    pass_mark { 1 }
    exam_code { 1 }
  end
end
