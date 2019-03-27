# == Schema Information
#
# Table name: answers
#
#  id         :bigint(8)        not null, primary key
#  score      :integer
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  station_id :integer
#

FactoryBot.define do
  factory :answer do
    text { "MyString" }
    score { 1 }
    station_id { 1 }
  end
end
