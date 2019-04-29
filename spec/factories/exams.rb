# == Schema Information
#
# Table name: exams
#
#  date        :date
#  exam_code   :string           not null, primary key
#  module_code :string
#  name        :string
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :exam do
    exam_code { "" }
    date { "" }
    name { "" }
    module_code { "" }
  end
end
